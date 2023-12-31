//
//  Created on 14.03.2022.
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

import XCTest
@testable import Search

final class SearchViewModelTests: XCTestCase {
    func testInitialStateIsEmptyWhenNoRecentSearchesArePresent() {
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: [], constants: Constants(numberOfCountries: 61), mode: .standard(.free))
        XCTAssertEqual(vm.status, SearchStatus.placeholder)
    }

    func testInitialStateIsRecentSearchesWhenPresent() {
        let service = RecentSearchesService(storage: SearchStorageMock())
        service.add(searchText: "One")
        service.add(searchText: "Two")
        let vm = SearchViewModel(recentSearchesService: service, data: [], constants: Constants(numberOfCountries: 61), mode: .standard(.free))
        XCTAssertEqual(vm.status, SearchStatus.recentSearches(["Two", "One"]))
    }

    func testClearingRecentSearchesGoesToPlaceholderState() {
        let service = RecentSearchesService(storage: SearchStorageMock())
        service.add(searchText: "One")
        service.add(searchText: "Two")
        let vm = SearchViewModel(recentSearchesService: service, data: [], constants: Constants(numberOfCountries: 61), mode: .standard(.free))
        vm.clearRecentSearches()
        XCTAssertEqual(vm.status, SearchStatus.placeholder)
    }

    func testAddingRecentSearchSavesIt() {
        let service = RecentSearchesService(storage: SearchStorageMock())
        let vm = SearchViewModel(recentSearchesService: service, data: [], constants: Constants(numberOfCountries: 61), mode: .standard(.free))
        vm.saveSearch(searchText: "One")
        XCTAssertEqual(service.get(), ["One"])
    }

    func testNothingIsFoundWithEmptyData() {
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: [], constants: Constants(numberOfCountries: 61), mode: .standard(.free))
        vm.search(searchText: "Fra")
        XCTAssertEqual(vm.status, SearchStatus.noResults)
    }

    func testSearchingInFreeModeShouldContainsUpsell() {
        let data: [CountryViewModel] = [
            CountryViewModelMock(country: "France", servers: [:])
        ]
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: data, constants: Constants(numberOfCountries: 61), mode: .standard(.free))
        vm.search(searchText: "Fra")
        XCTAssertEqual(vm.status, SearchStatus.results([SearchResult.upsell, SearchResult.countries(countries: data)]))
    }

    func testSearchingInStandardModeShouldDoesNotContainUpsell() {
        let data: [CountryViewModel] = [
            CountryViewModelMock(country: "France", servers: [:])
        ]
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: data, constants: Constants(numberOfCountries: 61), mode: .standard(.plus))
        vm.search(searchText: "Fra")
        XCTAssertEqual(vm.status, SearchStatus.results([SearchResult.countries(countries: data)]))
    }

    func testSearchingInSecureCoreModeShouldDoesNotContainUpsell() {
        let data: [CountryViewModel] = [
            CountryViewModelMock(country: "France", servers: [:])
        ]
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: data, constants: Constants(numberOfCountries: 61), mode: .standard(.plus))
        vm.search(searchText: "Fra")
        XCTAssertEqual(vm.status, SearchStatus.results([SearchResult.countries(countries: data)]))
    }

    func testSearchingCountries() {
        let france = CountryViewModelMock(country: "France", servers: [:])
        let finland = CountryViewModelMock(country: "Finland", servers: [:])
        let switzerland = CountryViewModelMock(country: "Switzerland", servers: [:])
        let us = CountryViewModelMock(country: "United States", servers: [:])

        let data: [CountryViewModel] = [
            france,
            finland,
            switzerland,
            us,
        ]
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: data, constants: Constants(numberOfCountries: 61), mode: .standard(.plus))

        vm.search(searchText: "Fra")
        XCTAssertEqual(vm.status, SearchStatus.results([SearchResult.countries(countries: [france])]))

        vm.search(searchText: "F")
        XCTAssertEqual(vm.status, SearchStatus.results([SearchResult.countries(countries: [france, finland])]))

        vm.search(searchText: "sta")
        XCTAssertEqual(vm.status, SearchStatus.results([SearchResult.countries(countries: [us])]))

        vm.search(searchText: "bel")
        XCTAssertEqual(vm.status, SearchStatus.noResults)
    }

    func testSearchingServers() {
        let fr1 = ServerViewModelMock(server: "FR#1", city: "Marseille", countryName: "France")
        let marseille = CityViewModelMock(cityName: "Marseille")
        let fr2 = ServerViewModelMock(server: "FR#2", city: "Paris", countryName: "France")
        let paris = CityViewModelMock(cityName: "Paris")
        let france = CountryViewModelMock(country: "France", servers: [ServerTier.plus: [fr1, fr2]])
        let finland = CountryViewModelMock(country: "Finland", servers: [:])
        let ch1 = ServerViewModelMock(server: "CH#1", city: "Geneva", countryName: "Switzerland")
        let ch2 = ServerViewModelMock(server: "CH#2", city: "Zurich", countryName: "Switzerland")
        let switzerland = CountryViewModelMock(country: "Switzerland", servers: [ServerTier.free: [ch1], ServerTier.plus: [ch2]])
        let us = CountryViewModelMock(country: "United States", servers: [:])

        let data: [CountryViewModel] = [
            france,
            finland,
            switzerland,
            us,
        ]
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: data, constants: Constants(numberOfCountries: 61), mode: .standard(.plus))

        vm.search(searchText: "ch")
        XCTAssertEqual(vm.status, SearchStatus.results([
            SearchResult.servers(tier: ServerTier.plus, servers: [ch2]),
            SearchResult.servers(tier: ServerTier.free, servers: [ch1])
        ]))

        vm.search(searchText: "ch#1")
        XCTAssertEqual(vm.status, SearchStatus.results([
            SearchResult.servers(tier: ServerTier.free, servers: [ch1]),
        ]))

        vm.search(searchText: "F")
        XCTAssertEqual(vm.status, SearchStatus.results([
            SearchResult.countries(countries: [france, finland]),
            SearchResult.cities(cities: [marseille, paris]),
            SearchResult.servers(tier: ServerTier.plus, servers: [fr1, fr2])
        ]))

        vm.search(searchText: "sta")
        XCTAssertEqual(vm.status, SearchStatus.results([SearchResult.countries(countries: [us])]))

        vm.search(searchText: "be")
        XCTAssertEqual(vm.status, SearchStatus.noResults)
    }

    func testSearchingSecureCoreCountries() {
        let fr1 = ServerViewModelMock(server: "FR#1", city: "Marseille", countryName: "France")
        let fr2 = ServerViewModelMock(server: "FR#2", city: "Paris", countryName: "France")
        let france = CountryViewModelMock(country: "France", servers: [ServerTier.plus: [fr1, fr2]])
        let finland = CountryViewModelMock(country: "Finland", servers: [:])
        let switzerland = CountryViewModelMock(country: "Switzerland", servers: [:])
        let us = CountryViewModelMock(country: "United States", servers: [:])

        let data: [CountryViewModel] = [
            france,
            finland,
            switzerland,
            us,
        ]
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: data, constants: Constants(numberOfCountries: 61), mode: .secureCore)

        vm.search(searchText: "Fra")
        XCTAssertEqual(vm.status, SearchStatus.results([SearchResult.secureCoreCountries(servers: [fr1, fr2])]))

        vm.search(searchText: "F")
        XCTAssertEqual(vm.status, SearchStatus.results([SearchResult.secureCoreCountries(servers: [fr1, fr2])]))

        vm.search(searchText: "sta")
        XCTAssertEqual(vm.status, SearchStatus.noResults)
    }

    func testSortingServersForFreeUsers() {
        let free1 = ServerViewModelMock(server: "FR#1", city: "Marseille", countryName: "France")
        let marseille = CityViewModelMock(cityName: "Marseille")
        let free2 = ServerViewModelMock(server: "FR#2", city: "Paris", countryName: "France")
        let paris = CityViewModelMock(cityName: "Paris")
        let plus1 = ServerViewModelMock(server: "FR#5", city: "Marseille", countryName: "France")
        let france = CountryViewModelMock(country: "France", servers: [
            ServerTier.free: [free1, free2],
            ServerTier.plus: [plus1]
        ])

        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: [france], constants: Constants(numberOfCountries: 61), mode: .standard(.free))

        vm.search(searchText: "F")
        XCTAssertEqual(vm.status, SearchStatus.results([
            SearchResult.upsell,
            SearchResult.countries(countries: [france]),
            SearchResult.cities(cities: [marseille, paris]),
            SearchResult.servers(tier: ServerTier.free, servers: [free1, free2]),
            SearchResult.servers(tier: ServerTier.plus, servers: [plus1])
        ]))
    }

    func testSortingServersForPlusUsers() {
        let free1 = ServerViewModelMock(server: "FR#1", city: "Marseille", countryName: "France")
        let marseille = CityViewModelMock(cityName: "Marseille")
        let free2 = ServerViewModelMock(server: "FR#2", city: "Paris", countryName: "France")
        let paris = CityViewModelMock(cityName: "Paris")
        let plus1 = ServerViewModelMock(server: "FR#5", city: "Marseille", countryName: "France")
        let france = CountryViewModelMock(country: "France", servers: [
            ServerTier.free: [free1, free2],
            ServerTier.plus: [plus1]
        ])

        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: [france], constants: Constants(numberOfCountries: 61), mode: .standard(.plus))

        vm.search(searchText: "F")
        XCTAssertEqual(vm.status, SearchStatus.results([
            SearchResult.countries(countries: [france]),
            SearchResult.cities(cities: [marseille, paris]),
            SearchResult.servers(tier: ServerTier.plus, servers: [plus1]),
            SearchResult.servers(tier: ServerTier.free, servers: [free1, free2])
        ]))
    }

    func testSearchingCitiesByName() {
        let fr1 = ServerViewModelMock(server: "FR#1", city: "Marseille", countryName: "France")
        let marseille = CityViewModelMock(cityName: "Marseille")
        let fr2 = ServerViewModelMock(server: "FR#2", city: "Paris", countryName: "France")
        let paris = CityViewModelMock(cityName: "Paris")
        let france = CountryViewModelMock(country: "France", servers: [ServerTier.plus: [fr1, fr2]])
        let fi1 = ServerViewModelMock(server: "FI#2", city: "Paimio", countryName: "Finland")
        let paimo = CityViewModelMock(cityName: "Paimio")
        let finland = CountryViewModelMock(country: "Finland", servers: [ServerTier.plus: [fi1]])

        let data: [CountryViewModel] = [
            france,
            finland
        ]
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: data, constants: Constants(numberOfCountries: 61), mode: .standard(.plus))

        vm.search(searchText: "Pa")
        XCTAssertEqual(vm.status, SearchStatus.results([
            SearchResult.cities(cities: [paimo, paris])
        ]))

        vm.search(searchText: "M")
        XCTAssertEqual(vm.status, SearchStatus.results([
            SearchResult.cities(cities: [marseille])
        ]))
    }

    func testSearchingCitiesByCountryName() {
        let fr1 = ServerViewModelMock(server: "FR#1", city: "Marseille", countryName: "France")
        let marseille = CityViewModelMock(cityName: "Marseille")
        let fr2 = ServerViewModelMock(server: "FR#2", city: "Paris", countryName: "France")
        let paris = CityViewModelMock(cityName: "Paris")
        let france = CountryViewModelMock(country: "France", servers: [ServerTier.plus: [fr1, fr2]])
        let fi1 = ServerViewModelMock(server: "FI#2", city: "Paimio", countryName: "Finland")
        let paimo = CityViewModelMock(cityName: "Paimio")
        let finland = CountryViewModelMock(country: "Finland", servers: [ServerTier.plus: [fi1]])

        let data: [CountryViewModel] = [
            france,
            finland
        ]
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: data, constants: Constants(numberOfCountries: 61), mode: .standard(.plus))

        vm.search(searchText: "F")
        XCTAssertEqual(vm.status, SearchStatus.results([
            SearchResult.countries(countries: [france, finland]),
            SearchResult.cities(cities: [marseille, paimo, paris]),
            SearchResult.servers(tier: ServerTier.plus, servers: [fr1, fr2, fi1])
        ]))
    }

    func testSearchingCitiesByTranslatedNames() {
        let cz1 = ServerViewModelMock(server: "CZ#1", city: "Prague", countryName: "Czechia", translatedCity: "Praha")
        let cz2 = ServerViewModelMock(server: "CZ#1", city: "Brno", countryName: "Czechia")
        let prague = CityViewModelMock(cityName: "Prague", translatedCityName: "Praha")
        let czechia = CountryViewModelMock(country: "Czechia", servers: [ServerTier.plus: [cz1, cz2]])

        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: [czechia], constants: Constants(numberOfCountries: 61), mode: .standard(.plus))

        vm.search(searchText: "Prag")
        XCTAssertEqual(vm.status, SearchStatus.results([
            SearchResult.cities(cities: [prague])
        ]))

        vm.search(searchText: "Prah")
        XCTAssertEqual(vm.status, SearchStatus.results([
            SearchResult.cities(cities: [prague])
        ]))
    }

    func testSearchingCountriesWithMultipleWords() {
        let us = CountryViewModelMock(country: "United States", servers: [:])
        let vm = SearchViewModel(recentSearchesService: RecentSearchesService(storage: SearchStorageMock()), data: [us], constants: Constants(numberOfCountries: 61), mode: .standard(.plus))

        vm.search(searchText: "united")
        XCTAssertEqual(vm.status, SearchStatus.results([
            .countries(countries: [us])
        ]))

        vm.search(searchText: "united ")
        XCTAssertEqual(vm.status, SearchStatus.results([
            .countries(countries: [us])
        ]))

        vm.search(searchText: "united st")
        XCTAssertEqual(vm.status, SearchStatus.results([
            .countries(countries: [us])
        ]))

        vm.search(searchText: "united states")
        XCTAssertEqual(vm.status, SearchStatus.results([
            .countries(countries: [us])
        ]))
    }
}
