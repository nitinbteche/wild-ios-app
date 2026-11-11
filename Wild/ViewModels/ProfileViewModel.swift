import Foundation
import SwiftUI

public class ProfileViewModel: ObservableObject {
    @AppStorage("ranger_name") public var rangerName: String = "Wild Explorer"
    @AppStorage("ranger_title") public var rangerRank: String = "Senior Field Naturalist"
    @AppStorage("use_metric_units") public var useMetricUnits: Bool = true
    @AppStorage("offline_cache_enabled") public var offlineCacheEnabled: Bool = true

    public let dataStore: DataStore

    public init(dataStore: DataStore = .shared) {
        self.dataStore = dataStore
    }

    public var unlockedAchievementsCount: Int {
        dataStore.achievements.filter { $0.isUnlocked }.count
    }

    public var totalAchievementsCount: Int {
        dataStore.achievements.count
    }

    public var totalSightingsCount: Int {
        dataStore.sightings.count
    }

    public var distinctSpeciesCount: Int {
        Set(dataStore.sightings.map { $0.speciesName }).count
    }
}
