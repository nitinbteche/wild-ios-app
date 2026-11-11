import Foundation
import Combine
import SwiftUI

public class DataStore: ObservableObject {
    public static let shared = DataStore()

    @Published public var species: [Species] = []
    @Published public var sightings: [Sighting] = []
    @Published public var habitats: [Habitat] = []
    @Published public var achievements: [Achievement] = []
    @Published public var soundscapes: [Soundscape] = []
    @Published public var bookmarkedSpeciesIDs: Set<UUID> = []

    private let sightingsKey = "wild_saved_sightings_v1"
    private let bookmarksKey = "wild_bookmarked_species_v1"

    public init() {
        loadInitialData()
    }

    private func loadInitialData() {
        self.species = MockDataLoader.sampleSpecies
        self.habitats = MockDataLoader.sampleHabitats
        self.achievements = MockDataLoader.sampleAchievements
        self.soundscapes = MockDataLoader.sampleSoundscapes

        // Load saved sightings if any exist, else default sample sightings
        if let data = UserDefaults.standard.data(forKey: sightingsKey),
           let decoded = try? JSONDecoder().decode([Sighting].self, from: data) {
            self.sightings = decoded
        } else {
            self.sightings = MockDataLoader.sampleSightings
            saveSightings()
        }

        // Load bookmarks
        if let bookmarks = UserDefaults.standard.array(forKey: bookmarksKey) as? [String] {
            self.bookmarkedSpeciesIDs = Set(bookmarks.compactMap { UUID(uuidString: $0) })
        }
    }

    public func addSighting(_ sighting: Sighting) {
        sightings.insert(sighting, at: 0)
        saveSightings()
        checkAchievements()
    }

    public func deleteSighting(withId id: UUID) {
        sightings.removeAll { $0.id == id }
        saveSightings()
    }

    public func deleteSightings(at offsets: IndexSet) {
        sightings.remove(atOffsets: offsets)
        saveSightings()
    }

    private func saveSightings() {
        if let encoded = try? JSONEncoder().encode(sightings) {
            UserDefaults.standard.set(encoded, forKey: sightingsKey)
        }
    }

    public func toggleBookmark(for speciesId: UUID) {
        if bookmarkedSpeciesIDs.contains(speciesId) {
            bookmarkedSpeciesIDs.remove(speciesId)
        } else {
            bookmarkedSpeciesIDs.insert(speciesId)
        }
        let strings = bookmarkedSpeciesIDs.map { $0.uuidString }
        UserDefaults.standard.set(strings, forKey: bookmarksKey)
    }

    public func isBookmarked(_ speciesId: UUID) -> Bool {
        bookmarkedSpeciesIDs.contains(speciesId)
    }

    private func checkAchievements() {
        let totalCount = sightings.count
        let birdCount = sightings.filter { $0.category == .bird }.count
        let marineCount = sightings.filter { $0.category == .marine }.count

        for i in 0..<achievements.count {
            if achievements[i].title == "First Step into the Wild" && totalCount >= 1 {
                achievements[i].currentProgress = min(totalCount, 1)
                achievements[i].isUnlocked = true
            } else if achievements[i].title == "Avian Enthusiast" {
                achievements[i].currentProgress = min(birdCount, achievements[i].requiredCount)
                if birdCount >= achievements[i].requiredCount {
                    achievements[i].isUnlocked = true
                }
            } else if achievements[i].title == "Ocean Sentinel" {
                achievements[i].currentProgress = min(marineCount, achievements[i].requiredCount)
                if marineCount >= achievements[i].requiredCount {
                    achievements[i].isUnlocked = true
                }
            } else if achievements[i].title == "Master Ranger" {
                achievements[i].currentProgress = min(totalCount, achievements[i].requiredCount)
                if totalCount >= achievements[i].requiredCount {
                    achievements[i].isUnlocked = true
                }
            }
        }
    }
}
