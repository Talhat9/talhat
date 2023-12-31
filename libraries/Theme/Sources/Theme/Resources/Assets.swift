// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Asset {
  public static let sharedCarrotBase = ColorAsset(name: "SharedCarrotBase")
  public static let sharedCeriseBase = ColorAsset(name: "SharedCeriseBase")
  public static let sharedCobaltBase = ColorAsset(name: "SharedCobaltBase")
  public static let sharedCopperBase = ColorAsset(name: "SharedCopperBase")
  public static let sharedEnzianBase = ColorAsset(name: "SharedEnzianBase")
  public static let sharedFernBase = ColorAsset(name: "SharedFernBase")
  public static let sharedForestBase = ColorAsset(name: "SharedForestBase")
  public static let sharedOceanBase = ColorAsset(name: "SharedOceanBase")
  public static let sharedOliveBase = ColorAsset(name: "SharedOliveBase")
  public static let sharedPacificBase = ColorAsset(name: "SharedPacificBase")
  public static let sharedPickleBase = ColorAsset(name: "SharedPickleBase")
  public static let sharedPineBase = ColorAsset(name: "SharedPineBase")
  public static let sharedPinkBase = ColorAsset(name: "SharedPinkBase")
  public static let sharedPlumBase = ColorAsset(name: "SharedPlumBase")
  public static let sharedPurpleBase = ColorAsset(name: "SharedPurpleBase")
  public static let sharedReefBase = ColorAsset(name: "SharedReefBase")
  public static let sharedSaharaBase = ColorAsset(name: "SharedSaharaBase")
  public static let sharedSlateblueBase = ColorAsset(name: "SharedSlateblueBase")
  public static let sharedSoilBase = ColorAsset(name: "SharedSoilBase")
  public static let sharedStrawberryBase = ColorAsset(name: "SharedStrawberryBase")
  public static let mobileBackgroundDeep = ColorAsset(name: "MobileBackgroundDeep")
  public static let mobileBackgroundNorm = ColorAsset(name: "MobileBackgroundNorm")
  public static let mobileBackgroundSecondary = ColorAsset(name: "MobileBackgroundSecondary")
  public static let mobileBlenderNorm = ColorAsset(name: "MobileBlenderNorm")
  public static let mobileBrandDarken20 = ColorAsset(name: "MobileBrandDarken20")
  public static let mobileBrandDarken40 = ColorAsset(name: "MobileBrandDarken40")
  public static let mobileBrandLighten20 = ColorAsset(name: "MobileBrandLighten20")
  public static let mobileBrandLighten40 = ColorAsset(name: "MobileBrandLighten40")
  public static let mobileBrandNorm = ColorAsset(name: "MobileBrandNorm")
  public static let mobileFloatyBackground = ColorAsset(name: "MobileFloatyBackground")
  public static let mobileFloatyPressed = ColorAsset(name: "MobileFloatyPressed")
  public static let mobileFloatyText = ColorAsset(name: "MobileFloatyText")
  public static let mobileIconAccent = ColorAsset(name: "MobileIconAccent")
  public static let mobileIconDisabled = ColorAsset(name: "MobileIconDisabled")
  public static let mobileIconHint = ColorAsset(name: "MobileIconHint")
  public static let mobileIconInverted = ColorAsset(name: "MobileIconInverted")
  public static let mobileIconNorm = ColorAsset(name: "MobileIconNorm")
  public static let mobileIconWeak = ColorAsset(name: "MobileIconWeak")
  public static let mobileInteractionStrong = ColorAsset(name: "MobileInteractionStrong")
  public static let mobileInteractionStrongPressed = ColorAsset(name: "MobileInteractionStrongPressed")
  public static let mobileInteractionWeak = ColorAsset(name: "MobileInteractionWeak")
  public static let mobileInteractionWeakDisabled = ColorAsset(name: "MobileInteractionWeakDisabled")
  public static let mobileInteractionWeakPressed = ColorAsset(name: "MobileInteractionWeakPressed")
  public static let mobileInteractionNorm = ColorAsset(name: "MobileInteractionNorm")
  public static let mobileInteractionNormDisabled = ColorAsset(name: "MobileInteractionNormDisabled")
  public static let mobileInteractionNormPressed = ColorAsset(name: "MobileInteractionNormPressed")
  public static let mobileNotificationError = ColorAsset(name: "MobileNotificationError")
  public static let mobileNotificationNorm = ColorAsset(name: "MobileNotificationNorm")
  public static let mobileNotificationSuccess = ColorAsset(name: "MobileNotificationSuccess")
  public static let mobileNotificationWarning = ColorAsset(name: "MobileNotificationWarning")
  public static let mobileSeparatorNorm = ColorAsset(name: "MobileSeparatorNorm")
  public static let mobileShade0 = ColorAsset(name: "MobileShade0")
  public static let mobileShade10 = ColorAsset(name: "MobileShade10")
  public static let mobileShade100 = ColorAsset(name: "MobileShade100")
  public static let mobileShade15 = ColorAsset(name: "MobileShade15")
  public static let mobileShade20 = ColorAsset(name: "MobileShade20")
  public static let mobileShade40 = ColorAsset(name: "MobileShade40")
  public static let mobileShade50 = ColorAsset(name: "MobileShade50")
  public static let mobileShade60 = ColorAsset(name: "MobileShade60")
  public static let mobileShade80 = ColorAsset(name: "MobileShade80")
  public static let mobileSidebarBackground = ColorAsset(name: "MobileSidebarBackground")
  public static let mobileSidebarIconNorm = ColorAsset(name: "MobileSidebarIconNorm")
  public static let mobileSidebarIconWeak = ColorAsset(name: "MobileSidebarIconWeak")
  public static let mobileSidebarInteractionPressed = ColorAsset(name: "MobileSidebarInteractionPressed")
  public static let mobileSidebarInteractionWeakNorm = ColorAsset(name: "MobileSidebarInteractionWeakNorm")
  public static let mobileSidebarInteractionWeakPressed = ColorAsset(name: "MobileSidebarInteractionWeakPressed")
  public static let mobileSidebarSeparator = ColorAsset(name: "MobileSidebarSeparator")
  public static let mobileSidebarTextNorm = ColorAsset(name: "MobileSidebarTextNorm")
  public static let mobileSidebarTextWeak = ColorAsset(name: "MobileSidebarTextWeak")
  public static let mobileTextAccent = ColorAsset(name: "MobileTextAccent")
  public static let mobileTextDisabled = ColorAsset(name: "MobileTextDisabled")
  public static let mobileTextHint = ColorAsset(name: "MobileTextHint")
  public static let mobileTextInverted = ColorAsset(name: "MobileTextInverted")
  public static let mobileTextNorm = ColorAsset(name: "MobileTextNorm")
  public static let mobileTextWeak = ColorAsset(name: "MobileTextWeak")
  public static let protonCarbonBackdropNorm = ColorAsset(name: "ProtonCarbonBackdropNorm")
  public static let protonCarbonBackgroundNorm = ColorAsset(name: "ProtonCarbonBackgroundNorm")
  public static let protonCarbonBackgroundStrong = ColorAsset(name: "ProtonCarbonBackgroundStrong")
  public static let protonCarbonBackgroundWeak = ColorAsset(name: "ProtonCarbonBackgroundWeak")
  public static let protonCarbonBorderNorm = ColorAsset(name: "ProtonCarbonBorderNorm")
  public static let protonCarbonBorderWeak = ColorAsset(name: "ProtonCarbonBorderWeak")
  public static let protonCarbonFieldDisabled = ColorAsset(name: "ProtonCarbonFieldDisabled")
  public static let protonCarbonFieldFocus = ColorAsset(name: "ProtonCarbonFieldFocus")
  public static let protonCarbonFieldHighlight = ColorAsset(name: "ProtonCarbonFieldHighlight")
  public static let protonCarbonFieldHighlightError = ColorAsset(name: "ProtonCarbonFieldHighlightError")
  public static let protonCarbonFieldHover = ColorAsset(name: "ProtonCarbonFieldHover")
  public static let protonCarbonFieldNorm = ColorAsset(name: "ProtonCarbonFieldNorm")
  public static let protonCarbonInteractionDefault = ColorAsset(name: "ProtonCarbonInteractionDefault")
  public static let protonCarbonInteractionDefaultActive = ColorAsset(name: "ProtonCarbonInteractionDefaultActive")
  public static let protonCarbonInteractionDefaultHover = ColorAsset(name: "ProtonCarbonInteractionDefaultHover")
  public static let protonCarbonInteractionNorm = ColorAsset(name: "ProtonCarbonInteractionNorm")
  public static let protonCarbonInteractionNormActive = ColorAsset(name: "ProtonCarbonInteractionNormActive")
  public static let protonCarbonInteractionNormHover = ColorAsset(name: "ProtonCarbonInteractionNormHover")
  public static let protonCarbonInteractionWeak = ColorAsset(name: "ProtonCarbonInteractionWeak")
  public static let protonCarbonInteractionWeakActive = ColorAsset(name: "ProtonCarbonInteractionWeakActive")
  public static let protonCarbonInteractionWeakHover = ColorAsset(name: "ProtonCarbonInteractionWeakHover")
  public static let protonCarbonLinkActive = ColorAsset(name: "ProtonCarbonLinkActive")
  public static let protonCarbonLinkHover = ColorAsset(name: "ProtonCarbonLinkHover")
  public static let protonCarbonLinkNorm = ColorAsset(name: "ProtonCarbonLinkNorm")
  public static let protonCarbonPrimary = ColorAsset(name: "ProtonCarbonPrimary")
  public static let protonCarbonShade0 = ColorAsset(name: "ProtonCarbonShade0")
  public static let protonCarbonShade10 = ColorAsset(name: "ProtonCarbonShade10")
  public static let protonCarbonShade100 = ColorAsset(name: "ProtonCarbonShade100")
  public static let protonCarbonShade20 = ColorAsset(name: "ProtonCarbonShade20")
  public static let protonCarbonShade40 = ColorAsset(name: "ProtonCarbonShade40")
  public static let protonCarbonShade50 = ColorAsset(name: "ProtonCarbonShade50")
  public static let protonCarbonShade60 = ColorAsset(name: "ProtonCarbonShade60")
  public static let protonCarbonShade80 = ColorAsset(name: "ProtonCarbonShade80")
  public static let protonCarbonShadowLifted = ColorAsset(name: "ProtonCarbonShadowLifted")
  public static let protonCarbonShadowNorm = ColorAsset(name: "ProtonCarbonShadowNorm")
  public static let protonCarbonSignalDanger = ColorAsset(name: "ProtonCarbonSignalDanger")
  public static let protonCarbonSignalDangerActive = ColorAsset(name: "ProtonCarbonSignalDangerActive")
  public static let protonCarbonSignalDangerHover = ColorAsset(name: "ProtonCarbonSignalDangerHover")
  public static let protonCarbonSignalInfo = ColorAsset(name: "ProtonCarbonSignalInfo")
  public static let protonCarbonSignalInfoActive = ColorAsset(name: "ProtonCarbonSignalInfoActive")
  public static let protonCarbonSignalInfoHover = ColorAsset(name: "ProtonCarbonSignalInfoHover")
  public static let protonCarbonSignalSuccess = ColorAsset(name: "ProtonCarbonSignalSuccess")
  public static let protonCarbonSignalSuccessActive = ColorAsset(name: "ProtonCarbonSignalSuccessActive")
  public static let protonCarbonSignalSuccessHover = ColorAsset(name: "ProtonCarbonSignalSuccessHover")
  public static let protonCarbonSignalWarning = ColorAsset(name: "ProtonCarbonSignalWarning")
  public static let protonCarbonSignalWarningActive = ColorAsset(name: "ProtonCarbonSignalWarningActive")
  public static let protonCarbonSignalWarningHover = ColorAsset(name: "ProtonCarbonSignalWarningHover")
  public static let protonCarbonTextDisabled = ColorAsset(name: "ProtonCarbonTextDisabled")
  public static let protonCarbonTextHint = ColorAsset(name: "ProtonCarbonTextHint")
  public static let protonCarbonTextInvert = ColorAsset(name: "ProtonCarbonTextInvert")
  public static let protonCarbonTextNorm = ColorAsset(name: "ProtonCarbonTextNorm")
  public static let protonCarbonTextWeak = ColorAsset(name: "ProtonCarbonTextWeak")
  public static let black = ColorAsset(name: "Black")
  public static let cloud = ColorAsset(name: "Cloud")
  public static let ebb = ColorAsset(name: "Ebb")
  public static let white = ColorAsset(name: "White")
  public static let icAlias = ImageAsset(name: "ic-alias")
  public static let icArchiveBox = ImageAsset(name: "ic-archive-box")
  public static let icArrowDownArrowUp = ImageAsset(name: "ic-arrow-down-arrow-up")
  public static let icArrowDownCircleFilled = ImageAsset(name: "ic-arrow-down-circle-filled")
  public static let icArrowDownCircle = ImageAsset(name: "ic-arrow-down-circle")
  public static let icArrowDownLine = ImageAsset(name: "ic-arrow-down-line")
  public static let icArrowDownToSquare = ImageAsset(name: "ic-arrow-down-to-square")
  public static let icArrowDown = ImageAsset(name: "ic-arrow-down")
  public static let icArrowInToRectangle = ImageAsset(name: "ic-arrow-in-to-rectangle")
  public static let icArrowLeftAndUp = ImageAsset(name: "ic-arrow-left-and-up")
  public static let icArrowLeft = ImageAsset(name: "ic-arrow-left")
  public static let icArrowOutFromRectangle = ImageAsset(name: "ic-arrow-out-from-rectangle")
  public static let icArrowOutSquare = ImageAsset(name: "ic-arrow-out-square")
  public static let icArrowOverSquare = ImageAsset(name: "ic-arrow-over-square")
  public static let icArrowRightArrowLeft = ImageAsset(name: "ic-arrow-right-arrow-left")
  public static let icArrowRight = ImageAsset(name: "ic-arrow-right")
  public static let icArrowRotateRight = ImageAsset(name: "ic-arrow-rotate-right")
  public static let icArrowUpAndLeft = ImageAsset(name: "ic-arrow-up-and-left")
  public static let icArrowUpBigLine = ImageAsset(name: "ic-arrow-up-big-line")
  public static let icArrowUpBounceLeft = ImageAsset(name: "ic-arrow-up-bounce-left")
  public static let icArrowUpCircleLine = ImageAsset(name: "ic-arrow-up-circle-line")
  public static let icArrowUpFromSquare = ImageAsset(name: "ic-arrow-up-from-square")
  public static let icArrowUpLine = ImageAsset(name: "ic-arrow-up-line")
  public static let icArrowUp = ImageAsset(name: "ic-arrow-up")
  public static let icArrowsCross = ImageAsset(name: "ic-arrows-cross")
  public static let icArrowsFromCenter = ImageAsset(name: "ic-arrows-from-center")
  public static let icArrowsLeftRight = ImageAsset(name: "ic-arrows-left-right")
  public static let icArrowsRotate = ImageAsset(name: "ic-arrows-rotate")
  public static let icArrowsSwapRight = ImageAsset(name: "ic-arrows-swap-right")
  public static let icArrowsSwitch = ImageAsset(name: "ic-arrows-switch")
  public static let icArrowsToCenter = ImageAsset(name: "ic-arrows-to-center")
  public static let icArrowsUpAndLeft = ImageAsset(name: "ic-arrows-up-and-left")
  public static let icAt = ImageAsset(name: "ic-at")
  public static let icBackspace = ImageAsset(name: "ic-backspace")
  public static let icBagPercent = ImageAsset(name: "ic-bag-percent")
  public static let icBell = ImageAsset(name: "ic-bell")
  public static let icBolt = ImageAsset(name: "ic-bolt")
  public static let icBookmarkFilled = ImageAsset(name: "ic-bookmark-filled")
  public static let icBookmark = ImageAsset(name: "ic-bookmark")
  public static let icBrandAndroid = ImageAsset(name: "ic-brand-android")
  public static let icBrandApple = ImageAsset(name: "ic-brand-apple")
  public static let icBrandChrome = ImageAsset(name: "ic-brand-chrome")
  public static let icBrandFirefox = ImageAsset(name: "ic-brand-firefox")
  public static let icBrandLinux = ImageAsset(name: "ic-brand-linux")
  public static let icBrandPaypal = ImageAsset(name: "ic-brand-paypal")
  public static let icBrandProtonCalendar = ImageAsset(name: "ic-brand-proton-calendar")
  public static let icBrandProtonDrive = ImageAsset(name: "ic-brand-proton-drive")
  public static let icBrandProtonMail = ImageAsset(name: "ic-brand-proton-mail")
  public static let icBrandProtonPass = ImageAsset(name: "ic-brand-proton-pass")
  public static let icBrandProtonVpn = ImageAsset(name: "ic-brand-proton-vpn")
  public static let icBrandProton = ImageAsset(name: "ic-brand-proton")
  public static let icBrandTor = ImageAsset(name: "ic-brand-tor")
  public static let icBrandTwitter = ImageAsset(name: "ic-brand-twitter")
  public static let icBrandWindows = ImageAsset(name: "ic-brand-windows")
  public static let icBrandWireguard = ImageAsset(name: "ic-brand-wireguard")
  public static let icBriefcase = ImageAsset(name: "ic-briefcase")
  public static let icBroom = ImageAsset(name: "ic-broom")
  public static let icBug = ImageAsset(name: "ic-bug")
  public static let icBuildings = ImageAsset(name: "ic-buildings")
  public static let icCalendar3day = ImageAsset(name: "ic-calendar-3day")
  public static let icCalendarCells = ImageAsset(name: "ic-calendar-cells")
  public static let icCalendarCheckmark = ImageAsset(name: "ic-calendar-checkmark")
  public static let icCalendarDay = ImageAsset(name: "ic-calendar-day")
  public static let icCalendarGrid = ImageAsset(name: "ic-calendar-grid")
  public static let icCalendarMonth = ImageAsset(name: "ic-calendar-month")
  public static let icCalendarRow = ImageAsset(name: "ic-calendar-row")
  public static let icCalendarToday = ImageAsset(name: "ic-calendar-today")
  public static let icCalendarWeek = ImageAsset(name: "ic-calendar-week")
  public static let icCamera = ImageAsset(name: "ic-camera")
  public static let icCardIdentity = ImageAsset(name: "ic-card-identity")
  public static let icChartLine = ImageAsset(name: "ic-chart-line")
  public static let icCheckmarkCircleFilled = ImageAsset(name: "ic-checkmark-circle-filled")
  public static let icCheckmarkCircle = ImageAsset(name: "ic-checkmark-circle")
  public static let icCheckmarkTriple = ImageAsset(name: "ic-checkmark-triple")
  public static let icCheckmark = ImageAsset(name: "ic-checkmark")
  public static let icChevronDownFilled = ImageAsset(name: "ic-chevron-down-filled")
  public static let icChevronDown = ImageAsset(name: "ic-chevron-down")
  public static let icChevronLeftFilled = ImageAsset(name: "ic-chevron-left-filled")
  public static let icChevronLeft = ImageAsset(name: "ic-chevron-left")
  public static let icChevronRightFilled = ImageAsset(name: "ic-chevron-right-filled")
  public static let icChevronRight = ImageAsset(name: "ic-chevron-right")
  public static let icChevronSquareLeft = ImageAsset(name: "ic-chevron-square-left")
  public static let icChevronSquareRight = ImageAsset(name: "ic-chevron-square-right")
  public static let icChevronTinyDown = ImageAsset(name: "ic-chevron-tiny-down")
  public static let icChevronTinyRight = ImageAsset(name: "ic-chevron-tiny-right")
  public static let icChevronUpFilled = ImageAsset(name: "ic-chevron-up-filled")
  public static let icChevronUp = ImageAsset(name: "ic-chevron-up")
  public static let icChevronsLeft = ImageAsset(name: "ic-chevrons-left")
  public static let icChevronsRight = ImageAsset(name: "ic-chevrons-right")
  public static let icCircleFilled = ImageAsset(name: "ic-circle-filled")
  public static let icCircleHalfFilled = ImageAsset(name: "ic-circle-half-filled")
  public static let icCircleSlash = ImageAsset(name: "ic-circle-slash")
  public static let icCircle = ImageAsset(name: "ic-circle")
  public static let icCirclesLock = ImageAsset(name: "ic-circles-lock")
  public static let icClockFilled = ImageAsset(name: "ic-clock-filled")
  public static let icClockPaperPlane = ImageAsset(name: "ic-clock-paper-plane")
  public static let icClockRotateLeft = ImageAsset(name: "ic-clock-rotate-left")
  public static let icClock = ImageAsset(name: "ic-clock")
  public static let icCloud = ImageAsset(name: "ic-cloud")
  public static let icCode = ImageAsset(name: "ic-code")
  public static let icCogWheelFilled = ImageAsset(name: "ic-cog-wheel-filled")
  public static let icCogWheel = ImageAsset(name: "ic-cog-wheel")
  public static let icCreditCard = ImageAsset(name: "ic-credit-card")
  public static let icCrossBig = ImageAsset(name: "ic-cross-big")
  public static let icCrossCircleFilled = ImageAsset(name: "ic-cross-circle-filled")
  public static let icCrossCircle = ImageAsset(name: "ic-cross-circle")
  public static let icCrossSmall = ImageAsset(name: "ic-cross-small")
  public static let icCross = ImageAsset(name: "ic-cross")
  public static let icDrive = ImageAsset(name: "ic-drive")
  public static let icEarthFilled = ImageAsset(name: "ic-earth-filled")
  public static let icEarth = ImageAsset(name: "ic-earth")
  public static let icEmoji = ImageAsset(name: "ic-emoji")
  public static let icEmptyCircle = ImageAsset(name: "ic-empty-circle")
  public static let icEnvelopeArrowUpAndRight = ImageAsset(name: "ic-envelope-arrow-up-and-right")
  public static let icEnvelopeCross = ImageAsset(name: "ic-envelope-cross")
  public static let icEnvelopeDot = ImageAsset(name: "ic-envelope-dot")
  public static let icEnvelopeMagnifyingGlass = ImageAsset(name: "ic-envelope-magnifying-glass")
  public static let icEnvelopeOpenText = ImageAsset(name: "ic-envelope-open-text")
  public static let icEnvelopeOpen = ImageAsset(name: "ic-envelope-open")
  public static let icEnvelope = ImageAsset(name: "ic-envelope")
  public static let icEnvelopes = ImageAsset(name: "ic-envelopes")
  public static let icEraser = ImageAsset(name: "ic-eraser")
  public static let icExclamationCircleFilled = ImageAsset(name: "ic-exclamation-circle-filled")
  public static let icExclamationCircle = ImageAsset(name: "ic-exclamation-circle")
  public static let icExclamationTriangleFilled = ImageAsset(name: "ic-exclamation-triangle-filled")
  public static let icEyeSlash = ImageAsset(name: "ic-eye-slash")
  public static let icEye = ImageAsset(name: "ic-eye")
  public static let icFileArrowInUp = ImageAsset(name: "ic-file-arrow-in-up")
  public static let icFileArrowIn = ImageAsset(name: "ic-file-arrow-in")
  public static let icFileArrowOut = ImageAsset(name: "ic-file-arrow-out")
  public static let icFileImage = ImageAsset(name: "ic-file-image")
  public static let icFileLines = ImageAsset(name: "ic-file-lines")
  public static let icFilePdf = ImageAsset(name: "ic-file-pdf")
  public static let icFileShapes = ImageAsset(name: "ic-file-shapes")
  public static let icFile = ImageAsset(name: "ic-file")
  public static let icFilingCabinet = ImageAsset(name: "ic-filing-cabinet")
  public static let icFilter = ImageAsset(name: "ic-filter")
  public static let icFingerprint = ImageAsset(name: "ic-fingerprint")
  public static let icFireSlash = ImageAsset(name: "ic-fire-slash")
  public static let icFire = ImageAsset(name: "ic-fire")
  public static let icFolderArrowInFilled = ImageAsset(name: "ic-folder-arrow-in-filled")
  public static let icFolderArrowIn = ImageAsset(name: "ic-folder-arrow-in")
  public static let icFolderArrowUp = ImageAsset(name: "ic-folder-arrow-up")
  public static let icFolderFilled = ImageAsset(name: "ic-folder-filled")
  public static let icFolderOpenFilled = ImageAsset(name: "ic-folder-open-filled")
  public static let icFolderOpen = ImageAsset(name: "ic-folder-open")
  public static let icFolderPlus = ImageAsset(name: "ic-folder-plus")
  public static let icFolder = ImageAsset(name: "ic-folder")
  public static let icFoldersFilled = ImageAsset(name: "ic-folders-filled")
  public static let icFolders = ImageAsset(name: "ic-folders")
  public static let icForward = ImageAsset(name: "ic-forward")
  public static let icGift = ImageAsset(name: "ic-gift")
  public static let icGlobe = ImageAsset(name: "ic-globe")
  public static let icGrid2 = ImageAsset(name: "ic-grid-2")
  public static let icGrid3 = ImageAsset(name: "ic-grid-3")
  public static let icHamburger = ImageAsset(name: "ic-hamburger")
  public static let icHeart = ImageAsset(name: "ic-heart")
  public static let icHook = ImageAsset(name: "ic-hook")
  public static let icHourglass = ImageAsset(name: "ic-hourglass")
  public static let icHouseFilled = ImageAsset(name: "ic-house-filled ")
  public static let icHouse = ImageAsset(name: "ic-house")
  public static let icImage = ImageAsset(name: "ic-image")
  public static let icInbox = ImageAsset(name: "ic-inbox")
  public static let icInfoCircleFilled = ImageAsset(name: "ic-info-circle-filled")
  public static let icInfoCircle = ImageAsset(name: "ic-info-circle")
  public static let icKeySkeleton = ImageAsset(name: "ic-key-skeleton")
  public static let icKey = ImageAsset(name: "ic-key")
  public static let icLanguage = ImageAsset(name: "ic-language")
  public static let icLifeRing = ImageAsset(name: "ic-life-ring")
  public static let icLightbulb = ImageAsset(name: "ic-lightbulb")
  public static let icLinesHorizontal = ImageAsset(name: "ic-lines-horizontal")
  public static let icLinesLongToSmall = ImageAsset(name: "ic-lines-long-to-small")
  public static let icLinesVertical = ImageAsset(name: "ic-lines-vertical")
  public static let icLinkPen = ImageAsset(name: "ic-link-pen")
  public static let icLinkSlash = ImageAsset(name: "ic-link-slash")
  public static let icLink = ImageAsset(name: "ic-link")
  public static let icListBullets = ImageAsset(name: "ic-list-bullets")
  public static let icListNumbers = ImageAsset(name: "ic-list-numbers")
  public static let icLockCheckFilled = ImageAsset(name: "ic-lock-check-filled")
  public static let icLockExclamationFilled = ImageAsset(name: "ic-lock-exclamation-filled")
  public static let icLockFilled = ImageAsset(name: "ic-lock-filled")
  public static let icLockLayers = ImageAsset(name: "ic-lock-layers")
  public static let icLockOpenCheckFilled = ImageAsset(name: "ic-lock-open-check-filled")
  public static let icLockOpenExclamationFilled = ImageAsset(name: "ic-lock-open-exclamation-filled")
  public static let icLockOpenFilled2 = ImageAsset(name: "ic-lock-open-filled-2")
  public static let icLockOpenFilled = ImageAsset(name: "ic-lock-open-filled")
  public static let icLockOpenPenFilled = ImageAsset(name: "ic-lock-open-pen-filled")
  public static let icLockOpen = ImageAsset(name: "ic-lock-open")
  public static let icLockPenFilled = ImageAsset(name: "ic-lock-pen-filled")
  public static let icLock = ImageAsset(name: "ic-lock")
  public static let icLocksFilled = ImageAsset(name: "ic-locks-filled")
  public static let icLocks = ImageAsset(name: "ic-locks")
  public static let icLowDash = ImageAsset(name: "ic-low-dash")
  public static let icMagicWand = ImageAsset(name: "ic-magic-wand")
  public static let icMagnifier = ImageAsset(name: "ic-magnifier")
  public static let icMailbox = ImageAsset(name: "ic-mailbox")
  public static let icMapPin = ImageAsset(name: "ic-map-pin")
  public static let icMap = ImageAsset(name: "ic-map")
  public static let icMinusCircle = ImageAsset(name: "ic-minus-circle")
  public static let icMinus = ImageAsset(name: "ic-minus")
  public static let icMobilePlus = ImageAsset(name: "ic-mobile-plus")
  public static let icMobile = ImageAsset(name: "ic-mobile")
  public static let icMoneyBills = ImageAsset(name: "ic-money-bills")
  public static let icMoon = ImageAsset(name: "ic-moon")
  public static let icNote = ImageAsset(name: "ic-note")
  public static let icNotepadChecklist = ImageAsset(name: "ic-notepad-checklist")
  public static let icPaintRoller = ImageAsset(name: "ic-paint-roller")
  public static let icPalette = ImageAsset(name: "ic-palette")
  public static let icPaperClipVertical = ImageAsset(name: "ic-paper-clip-vertical")
  public static let icPaperClip = ImageAsset(name: "ic-paper-clip")
  public static let icPaperPlaneHorizontal = ImageAsset(name: "ic-paper-plane-horizontal")
  public static let icPaperPlane = ImageAsset(name: "ic-paper-plane")
  public static let icPauseFilled = ImageAsset(name: "ic-pause-filled")
  public static let icPause = ImageAsset(name: "ic-pause")
  public static let icPenSquare = ImageAsset(name: "ic-pen-square")
  public static let icPen = ImageAsset(name: "ic-pen")
  public static let icPencil = ImageAsset(name: "ic-pencil")
  public static let icPhone = ImageAsset(name: "ic-phone")
  public static let icPinFilled = ImageAsset(name: "ic-pin-filled")
  public static let icPinSlashFilled = ImageAsset(name: "ic-pin-slash-filled")
  public static let icPlayFilled = ImageAsset(name: "ic-play-filled")
  public static let icPlay = ImageAsset(name: "ic-play")
  public static let icPlusCircleFilled = ImageAsset(name: "ic-plus-circle-filled")
  public static let icPlusCircle = ImageAsset(name: "ic-plus-circle")
  public static let icPlus = ImageAsset(name: "ic-plus")
  public static let icPowerOff = ImageAsset(name: "ic-power-off")
  public static let icPresentationScreen = ImageAsset(name: "ic-presentation-screen")
  public static let icPrinter = ImageAsset(name: "ic-printer")
  public static let icQuestionCircleFilled = ImageAsset(name: "ic-question-circle-filled")
  public static let icQuestionCircle = ImageAsset(name: "ic-question-circle")
  public static let icReplyAll = ImageAsset(name: "ic-reply-all")
  public static let icReply = ImageAsset(name: "ic-reply")
  public static let icRobot = ImageAsset(name: "ic-robot")
  public static let icRocket = ImageAsset(name: "ic-rocket")
  public static let icServers = ImageAsset(name: "ic-servers")
  public static let icShieldFilled = ImageAsset(name: "ic-shield-filled")
  public static let icShieldHalfFilled = ImageAsset(name: "ic-shield-half-filled")
  public static let icShield = ImageAsset(name: "ic-shield")
  public static let icSidePanelLeft = ImageAsset(name: "ic-side-panel-left")
  public static let icSidePanelRight = ImageAsset(name: "ic-side-panel-right")
  public static let icSliders = ImageAsset(name: "ic-sliders")
  public static let icSpeechBubble = ImageAsset(name: "ic-speech-bubble")
  public static let icSquares = ImageAsset(name: "ic-squares")
  public static let icStarFilled = ImageAsset(name: "ic-star-filled")
  public static let icStarSlash = ImageAsset(name: "ic-star-slash")
  public static let icStar = ImageAsset(name: "ic-star")
  public static let icStorage = ImageAsset(name: "ic-storage")
  public static let icSun = ImageAsset(name: "ic-sun")
  public static let icSwipeLeft = ImageAsset(name: "ic-swipe-left")
  public static let icSwitchOff = ImageAsset(name: "ic-switch-off")
  public static let icSwitchOnLock = ImageAsset(name: "ic-switch-on-lock")
  public static let icSwitchOn = ImageAsset(name: "ic-switch-on")
  public static let icTagFilled = ImageAsset(name: "ic-tag-filled")
  public static let icTagPlus = ImageAsset(name: "ic-tag-plus")
  public static let icTag = ImageAsset(name: "ic-tag")
  public static let icTags = ImageAsset(name: "ic-tags")
  public static let icTextAlignCenter = ImageAsset(name: "ic-text-align-center")
  public static let icTextAlignJustify = ImageAsset(name: "ic-text-align-justify")
  public static let icTextAlignLeft = ImageAsset(name: "ic-text-align-left")
  public static let icTextAlignRight = ImageAsset(name: "ic-text-align-right")
  public static let icTextBold = ImageAsset(name: "ic-text-bold")
  public static let icTextItalic = ImageAsset(name: "ic-text-italic")
  public static let icTextQuote = ImageAsset(name: "ic-text-quote")
  public static let icTextUnderline = ImageAsset(name: "ic-text-underline")
  public static let icThreeDotsHorizontal = ImageAsset(name: "ic-three-dots-horizontal")
  public static let icThreeDotsVertical = ImageAsset(name: "ic-three-dots-vertical")
  public static let icTrashClock = ImageAsset(name: "ic-trash-clock")
  public static let icTrashCrossFilled = ImageAsset(name: "ic-trash-cross-filled")
  public static let icTrashCross = ImageAsset(name: "ic-trash-cross")
  public static let icTrash = ImageAsset(name: "ic-trash")
  public static let icTv = ImageAsset(name: "ic-tv")
  public static let icUserArrowLeft = ImageAsset(name: "ic-user-arrow-left")
  public static let icUserArrowRight = ImageAsset(name: "ic-user-arrow-right")
  public static let icUserCircle = ImageAsset(name: "ic-user-circle")
  public static let icUserFilled = ImageAsset(name: "ic-user-filled")
  public static let icUserPlus = ImageAsset(name: "ic-user-plus")
  public static let icUser = ImageAsset(name: "ic-user")
  public static let icUsersFilled = ImageAsset(name: "ic-users-filled")
  public static let icUsersMerge = ImageAsset(name: "ic-users-merge")
  public static let icUsersPlus = ImageAsset(name: "ic-users-plus")
  public static let icUsers = ImageAsset(name: "ic-users")
  public static let icVault = ImageAsset(name: "ic-vault")
  public static let icWallet = ImageAsset(name: "ic-wallet")
  public static let icWindowImage = ImageAsset(name: "ic-window-image")
  public static let icWindowTerminal = ImageAsset(name: "ic-window-terminal")
  public static let icWrench = ImageAsset(name: "ic-wrench")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
