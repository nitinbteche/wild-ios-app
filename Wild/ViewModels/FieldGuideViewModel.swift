import Foundation
import Combine
import SwiftUI

public class FieldGuideViewModel: ObservableObject {
    @Published public var searchText: String = ""
    @Published public var selectedCategory: SpeciesCategory? = nil
    @Published public var selectedStatus: ConservationStatus? = nil
    @Published public var showOnlyBookmarks: Bool = false
    @Published public var isFilterSheetPresented: Bool = false

    private var cancellables = Set<AnyCancellable>()
    public let dataStore: DataStore

    public init(dataStore: DataStore = .shared) {
        self.dataStore = dataStore
    }

    public var filteredSpecies: [Species] {
        dataStore.species.filter { item in
            let matchesCategory = selectedCategory == nil || item.category == selectedCategory
            let matchesStatus = selectedStatus == nil || item.conservationStatus == selectedStatus
            let matchesBookmark = !showOnlyBookmarks || dataStore.isBookmarked(item.id)

            let matchesSearch = searchText.isEmpty ||
                item.commonName.localizedCaseInsensitiveContains(searchText) ||
                item.scientificName.localizedCaseInsensitiveContains(searchText) ||
                item.habitat.localizedCaseInsensitiveContains(searchText) ||
                item.region.localizedCaseInsensitiveContains(searchText)

            return matchesCategory && matchesStatus && matchesBookmark && matchesSearch
        }
    }

    public func clearFilters() {
        selectedCategory = nil
        selectedStatus = nil
        showOnlyBookmarks = false
        searchText = ""
    }

    public var hasActiveFilters: Bool {
        selectedCategory != nil || selectedStatus != nil || showOnlyBookmarks
    }
}
