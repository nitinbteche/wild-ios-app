import SwiftUI

public struct AchievementsView: View {
    @EnvironmentObject private var dataStore: DataStore

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header card
                VStack(spacing: 8) {
                    Image(systemName: "award.medal.fill")
                        .font(.system(size: 40))
                        .foregroundColor(WildTheme.amber)

                    Text("Ranger Field Badges")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)

                    Text("Earn official field accolades as you explore habitats and log species encounters.")
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top, 10)

                // Achievements Grid/List
                VStack(spacing: 12) {
                    ForEach(dataStore.achievements) { badge in
                        HStack(spacing: 14) {
                            ZStack {
                                Circle()
                                    .fill(badge.isUnlocked ? WildTheme.amber.opacity(0.18) : Color.gray.opacity(0.15))
                                    .frame(width: 50, height: 50)

                                Image(systemName: badge.iconSymbol)
                                    .font(.system(size: 22))
                                    .foregroundColor(badge.isUnlocked ? WildTheme.amber : .secondary)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(badge.title)
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(.primary)

                                    Spacer()

                                    if badge.isUnlocked {
                                        Text("UNLOCKED")
                                            .font(.system(size: 10, weight: .black))
                                            .foregroundColor(WildTheme.leafGreen)
                                            .padding(.horizontal, 6)
                                            .padding(.vertical, 3)
                                            .background(WildTheme.leafGreen.opacity(0.15))
                                            .clipShape(Capsule())
                                    }
                                }

                                Text(badge.detail)
                                    .font(.system(size: 12))
                                    .foregroundColor(.secondary)

                                // Progress bar
                                GeometryReader { geo in
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 3)
                                            .fill(Color.primary.opacity(0.08))
                                            .frame(height: 6)

                                        RoundedRectangle(cornerRadius: 3)
                                            .fill(badge.isUnlocked ? WildTheme.leafGreen : WildTheme.amber)
                                            .frame(width: geo.size.width * badge.progressFraction, height: 6)
                                    }
                                }
                                .frame(height: 6)
                                .padding(.top, 4)

                                HStack {
                                    Text("Progress: \(badge.currentProgress)/\(badge.requiredCount)")
                                        .font(.system(size: 10, weight: .medium))
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    if let date = badge.unlockedDate {
                                        Text("Unlocked \(date, style: .date)")
                                            .font(.system(size: 10))
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        .padding(14)
                        .background(WildTheme.cardBackground)
                        .cornerRadius(18)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(badge.isUnlocked ? WildTheme.amber.opacity(0.3) : Color.primary.opacity(0.06), lineWidth: 1)
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 24)
            }
        }
        .background(WildTheme.background.ignoresSafeArea())
        .navigationTitle("Achievements")
        .navigationBarTitleDisplayMode(.inline)
    }
}

public struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @EnvironmentObject private var dataStore: DataStore

    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Profile Header Card
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [WildTheme.forest, WildTheme.moss],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 84, height: 84)

                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 78))
                                .foregroundColor(.white.opacity(0.9))
                        }

                        VStack(spacing: 4) {
                            Text(viewModel.rangerName)
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)

                            Text(viewModel.rangerRank)
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(WildTheme.leafGreen)
                        }
                    }
                    .padding(.top, 12)

                    // Stats Matrix
                    HStack(spacing: 12) {
                        StatCounterCard(
                            title: "Sightings",
                            count: "\(viewModel.totalSightingsCount)",
                            iconSymbol: "binoculars.fill",
                            tintColor: WildTheme.moss
                        )
                        StatCounterCard(
                            title: "Species",
                            count: "\(viewModel.distinctSpeciesCount)",
                            iconSymbol: "pawprint.fill",
                            tintColor: WildTheme.leafGreen
                        )
                        StatCounterCard(
                            title: "Badges",
                            count: "\(viewModel.unlockedAchievementsCount)/\(viewModel.totalAchievementsCount)",
                            iconSymbol: "trophy.fill",
                            tintColor: WildTheme.amber
                        )
                    }
                    .padding(.horizontal)

                    // Achievements shortcut banner
                    NavigationLink(destination: AchievementsView()) {
                        HStack {
                            Image(systemName: "award.medal.fill")
                                .font(.system(size: 24))
                                .foregroundColor(WildTheme.amber)
                                .padding(10)
                                .background(WildTheme.amber.opacity(0.15))
                                .clipShape(Circle())

                            VStack(alignment: .leading, spacing: 2) {
                                Text("Field Badges & Milestones")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(.primary)

                                Text("\(viewModel.unlockedAchievementsCount) of \(viewModel.totalAchievementsCount) badges earned")
                                    .font(.system(size: 12))
                                    .foregroundColor(.secondary)
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundColor(.secondary)
                        }
                        .padding(14)
                        .background(WildTheme.cardBackground)
                        .cornerRadius(18)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.primary.opacity(0.06), lineWidth: 1)
                        )
                        .padding(.horizontal)
                    }

                    // Preferences & App Settings
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Field Preferences")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.secondary)
                            .padding(.horizontal)

                        VStack(spacing: 0) {
                            Toggle(isOn: $viewModel.useMetricUnits) {
                                Label("Use Metric System (km, kg, m)", systemImage: "ruler.fill")
                                    .font(.system(size: 14))
                            }
                            .padding()

                            Divider()

                            Toggle(isOn: $viewModel.offlineCacheEnabled) {
                                Label("Cache Field Guides Offline", systemImage: "arrow.down.circle.fill")
                                    .font(.system(size: 14))
                            }
                            .padding()
                        }
                        .background(WildTheme.cardBackground)
                        .cornerRadius(18)
                        .padding(.horizontal)
                    }

                    // About App
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About Wild iOS")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.secondary)
                            .padding(.horizontal)

                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Version")
                                    .font(.system(size: 14))
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("1.0.0 (Build 1)")
                                    .font(.system(size: 14, weight: .semibold))
                            }

                            Divider()

                            HStack {
                                Text("Taxonomy Database")
                                    .font(.system(size: 14))
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("IUCN Red List 2026.1")
                                    .font(.system(size: 14, weight: .semibold))
                            }

                            Divider()

                            HStack {
                                Text("Design System")
                                    .font(.system(size: 14))
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("SwiftUI Native")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                        }
                        .padding()
                        .background(WildTheme.cardBackground)
                        .cornerRadius(18)
                        .padding(.horizontal)
                    }

                    Spacer(minLength: 24)
                }
            }
            .background(WildTheme.background.ignoresSafeArea())
            .navigationTitle("Ranger Profile")
        }
    }
}
