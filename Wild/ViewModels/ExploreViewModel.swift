import Foundation
import Combine
import SwiftUI

public class ExploreViewModel: ObservableObject {
    @Published public var spotlightSpecies: Species?
    @Published public var featuredHabitats: [Habitat] = []
    @Published public var recentSightings: [Sighting] = []
    @Published public var activeMigrationNotice: String = "North American Monarch Autumn Migration underway across central corridors."

    private var cancellables = Set<AnyCancellable>()
    private let dataStore: DataStore

    public init(dataStore: DataStore = .shared) {
        self.dataStore = dataStore
        setupBindings()
    }

    private func setupBindings() {
        dataStore.$species
            .map { species in
                species.first { $0.isFeatured } ?? species.first
            }
            .assign(to: \.spotlightSpecies, on: self)
            .store(in: &cancellables)

        dataStore.$habitats
            .assign(to: \.featuredHabitats, on: self)
            .store(in: &cancellables)

        dataStore.$sightings
            .map { Array($0.prefix(3)) }
            .assign(to: \.recentSightings, on: self)
            .store(in: &cancellables)
    }

    public func cycleSpotlight() {
        let featured = dataStore.species.filter { $0.isFeatured }
        guard !featured.isEmpty else { return }
        if let current = spotlightSpecies,
           let currentIndex = featured.firstIndex(where: { $0.id == current.id }) {
            let nextIndex = (currentIndex + 1) % featured.count
            spotlightSpecies = featured[nextIndex]
        } else {
            spotlightSpecies = featured.first
        }
    }
}
