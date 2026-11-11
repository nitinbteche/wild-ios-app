import SwiftUI

public struct ExploreView: View {
    @StateObject private var viewModel = ExploreViewModel()
    @EnvironmentObject private var dataStore: DataStore
    @State private var showingNewSightingSheet = false

    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 22) {
                    // Header Brand Bar
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 6) {
                                Image(systemName: "leaf.fill")
                                    .foregroundColor(WildTheme.leafGreen)
                                    .font(.system(size: 16))
                                Text("WILD")
                                    .font(.system(size: 14, weight: .black))
                                    .tracking(2.5)
                                    .foregroundColor(WildTheme.leafGreen)
                            }

                            Text("Earth's Living Wonders")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                        }

                        Spacer()

                        Button(action: { showingNewSightingSheet = true }) {
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 42, height: 42)
                                .background(WildTheme.leafGreen)
                                .clipShape(Circle())
                                .shadow(color: WildTheme.leafGreen.opacity(0.4), radius: 6, x: 0, y: 3)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    // Migration Banner
                    MigrationAlertCard(message: viewModel.activeMigrationNotice)
                        .padding(.horizontal)

                    // Daily Spotlight
                    if let spotlight = viewModel.spotlightSpecies {
                        SpeciesSpotlightCard(species: spotlight) {
                            withAnimation(.spring()) {
                                viewModel.cycleSpotlight()
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Field Stats Overview
                    HStack(spacing: 12) {
                        StatCounterCard(
                            title: "Field Sightings",
                            count: "\(dataStore.sightings.count)",
                            iconSymbol: "binoculars.fill",
                            tintColor: WildTheme.moss
                        )
                        StatCounterCard(
                            title: "Unique Species",
                            count: "\(Set(dataStore.sightings.map { $0.speciesName }).count)",
                            iconSymbol: "pawprint.fill",
                            tintColor: WildTheme.leafGreen
                        )
                        StatCounterCard(
                            title: "Ranger Badges",
                            count: "\(dataStore.achievements.filter { $0.isUnlocked }.count)",
                            iconSymbol: "award.medal.fill",
                            tintColor: WildTheme.amber
                        )
                    }
                    .padding(.horizontal)

                    // Habitats Section
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Earth's Vital Biomes")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 14) {
                                ForEach(viewModel.featuredHabitats) { habitat in
                                    HabitatCard(habitat: habitat)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    // Recent Sightings Activity
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Recent Field Observations")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        .padding(.horizontal)

                        VStack(spacing: 10) {
                            ForEach(viewModel.recentSightings) { sighting in
                                NavigationLink(destination: SightingDetailView(sighting: sighting)) {
                                    HStack(spacing: 14) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(WildTheme.moss.opacity(0.15))
                                                .frame(width: 48, height: 48)

                                            Image(systemName: sighting.imageSymbol)
                                                .font(.system(size: 22))
                                                .foregroundColor(WildTheme.moss)
                                        }

                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(sighting.speciesName)
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(.primary)

                                            Text(sighting.locationName)
                                                .font(.system(size: 12, weight: .regular))
                                                .foregroundColor(.secondary)
                                                .lineLimit(1)
                                        }

                                        Spacer()

                                        VStack(alignment: .trailing, spacing: 4) {
                                            Text(sighting.timestamp, style: .date)
                                                .font(.system(size: 11, weight: .medium))
                                                .foregroundColor(.secondary)

                                            Text("\(sighting.count) spotted")
                                                .font(.system(size: 11, weight: .semibold))
                                                .foregroundColor(WildTheme.leafGreen)
                                        }
                                    }
                                    .padding(14)
                                    .background(WildTheme.cardBackground)
                                    .cornerRadius(16)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer(minLength: 28)
                }
            }
            .background(WildTheme.background.ignoresSafeArea())
            .sheet(isPresented: $showingNewSightingSheet) {
                NewSightingSheet()
            }
        }
    }
}
