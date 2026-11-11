import Foundation
import Combine
import SwiftUI

public class JournalViewModel: ObservableObject {
    @Published public var searchText: String = ""
    @Published public var selectedFilterCategory: SpeciesCategory? = nil
    @Published public var isShowingNewSightingSheet: Bool = false

    private var cancellables = Set<AnyCancellable>()
    public let dataStore: DataStore

    public init(dataStore: DataStore = .shared) {
        self.dataStore = dataStore
    }

    public var filteredSightings: [Sighting] {
        dataStore.sightings.filter { sighting in
            let matchesCategory = selectedFilterCategory == nil || sighting.category == selectedFilterCategory
            let matchesSearch = searchText.isEmpty ||
                sighting.speciesName.localizedCaseInsensitiveContains(searchText) ||
                sighting.locationName.localizedCaseInsensitiveContains(searchText) ||
                sighting.notes.localizedCaseInsensitiveContains(searchText)
            return matchesCategory && matchesSearch
        }
    }

    public var totalCount: Int {
        dataStore.sightings.count
    }

    public var uniqueSpeciesCount: Int {
        Set(dataStore.sightings.map { $0.speciesName }).count
    }

    public func delete(at offsets: IndexSet) {
        dataStore.deleteSightings(at: offsets)
    }

    public func delete(sighting: Sighting) {
        dataStore.deleteSighting(withId: sighting.id)
    }
}
