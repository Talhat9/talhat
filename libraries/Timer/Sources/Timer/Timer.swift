//
//  Created on 2022-08-08.
//
//  Copyright (c) 2022 Proton AG
//
//  ProtonVPN is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  ProtonVPN is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with ProtonVPN.  If not, see <https://www.gnu.org/licenses/>.

import Foundation

public protocol BackgroundTimer {
    var isValid: Bool { get }
    var nextTime: Date { get }
    mutating func invalidate()
}

public protocol TimerFactoryCreator {
    func makeTimerFactory() -> TimerFactory
}

public protocol TimerFactory {
    func scheduledTimer(runAt nextRunTime: Date,
                        repeating: Double?,
                        leeway: DispatchTimeInterval?,
                        queue: DispatchQueue,
                        _ closure: @escaping (() -> Void)) -> BackgroundTimer

    func scheduleAfter(_ interval: DispatchTimeInterval,
                       on queue: DispatchQueue,
                       _ closure: @escaping (() -> Void))
}

public extension TimerFactory {
    func scheduledTimer(timeInterval: TimeInterval,
                        repeats: Bool,
                        queue: DispatchQueue,
                        _ closure: @escaping (() -> Void)) -> BackgroundTimer {
        scheduledTimer(runAt: Date().addingTimeInterval(timeInterval),
                       repeating: repeats ? timeInterval : nil,
                       queue: queue,
                       closure)
    }

    func scheduledTimer(runAt nextRunTime: Date,
                        queue: DispatchQueue,
                        _ closure: @escaping (() -> Void)) -> BackgroundTimer {
        scheduledTimer(runAt: nextRunTime, repeating: nil, leeway: nil, queue: queue, closure)
    }

    func scheduledTimer(runAt nextRunTime: Date,
                        repeating: Double?,
                        queue: DispatchQueue,
                        _ closure: @escaping (() -> Void)) -> BackgroundTimer {
        scheduledTimer(runAt: nextRunTime, repeating: repeating, leeway: nil, queue: queue, closure)
    }

    func scheduledTimer(runAt nextRunTime: Date,
                        leeway: DispatchTimeInterval?,
                        queue: DispatchQueue,
                        _ closure: @escaping (() -> Void)) -> BackgroundTimer {
        scheduledTimer(runAt: nextRunTime, repeating: nil, leeway: leeway, queue: queue, closure)
    }
}

public class TimerFactoryImplementation: TimerFactory {
    public func scheduledTimer(runAt nextRunTime: Date,
                               repeating: Double?,
                               leeway: DispatchTimeInterval?,
                               queue: DispatchQueue,
                               _ closure: @escaping (() -> Void)) -> BackgroundTimer {
        BackgroundTimerImplementation(runAt: nextRunTime, repeating: repeating, leeway: leeway, queue: queue, closure)
    }

    public func scheduleAfter(_ interval: DispatchTimeInterval,
                              on queue: DispatchQueue,
                              _ closure: @escaping (() -> Void)) {
        queue.asyncAfter(deadline: .now() + interval, execute: closure)
    }

    public init() { }
}

public class BackgroundTimerImplementation: BackgroundTimer {
    private static let repeatingTimerLeeway: DispatchTimeInterval = .seconds(10)

    let timerSource: DispatchSourceTimer
    private var state: State = .suspended
    private let closure: () -> Void

    public var isValid: Bool
    public var nextTime: Date

    // Use this to inject mocked date during tests
    public var currentDate: () -> Date = { Date() }

    /// Helps to balance calls to `DispatchSourceTimer.suspend` and `DispatchSourceTimer.resume` to prevent exceptions.
    private enum State {
        case resumed
        case suspended
    }

    init(runAt nextRunTime: Date,
         repeating: Double?,
         leeway: DispatchTimeInterval?,
         queue: DispatchQueue,
         _ closure: @escaping () -> Void) {
        self.closure = closure
        timerSource = DispatchSource.makeTimerSource(queue: queue)

        if let repeating = repeating {
            timerSource.schedule(deadline: .now() + nextRunTime.timeIntervalSinceNow,
                                 repeating: repeating,
                                 leeway: leeway ?? Self.repeatingTimerLeeway)
        } else {
            timerSource.schedule(deadline: .now() + nextRunTime.timeIntervalSinceNow)
        }

        nextTime = nextRunTime
        isValid = true
        timerSource.setEventHandler { [weak self] in
            guard let self else { return }
            if let repeating {
                self.nextTime = self.currentDate().addingTimeInterval(repeating)
            }
            self.closure()
        }
        resume()
    }

    @objc func suspend() {
        guard case .resumed = state else { return }
        timerSource.suspend()
        state = .suspended
    }

    @objc func resume() {
        guard case .suspended = state else { return }
        timerSource.resume()
        state = .resumed
    }

    public func invalidate() {
        resume() // releasing a timer in the suspended state causes an exception
        timerSource.setEventHandler {}
        timerSource.cancel()
        isValid = false
    }

    deinit {
        invalidate()
    }
}
