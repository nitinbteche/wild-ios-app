import SwiftUI

public struct SpeciesDetailView: View {
    public let species: Species
    @EnvironmentObject private var dataStore: DataStore
    @State private var isPlayingCall = false
    @State private var showingLogSheet = false

    public init(species: Species) {
        self.species = species
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Hero Header Card
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        StatusBadge(status: species.conservationStatus)

                        Spacer()

                        Button(action: {
                            withAnimation(.spring()) {
                                dataStore.toggleBookmark(for: species.id)
                            }
                        }) {
                            Image(systemName: dataStore.isBookmarked(species.id) ? "bookmark.fill" : "bookmark")
                                .font(.system(size: 20))
                                .foregroundColor(dataStore.isBookmarked(species.id) ? WildTheme.amber : .white)
                                .padding(10)
                                .background(Color.white.opacity(0.15))
                                .clipShape(Circle())
                        }
                    }

                    HStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(WildTheme.leafGreen.opacity(0.3))
                                .frame(width: 80, height: 80)

                            Image(systemName: species.iconSymbol)
                                .font(.system(size: 38))
                                .foregroundColor(.white)
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(species.commonName)
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundColor(.white)

                            Text(species.scientificName)
                                .font(.system(size: 16, weight: .medium))
                                .italic()
                                .foregroundColor(.white.opacity(0.85))

                            HStack(spacing: 6) {
                                Image(systemName: species.category.icon)
                                Text(species.category.rawValue)
                            }
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(WildTheme.amber)
                            .padding(.top, 2)
                        }
                    }
                }
                .padding(20)
                .background(
                    LinearGradient(
                        colors: [WildTheme.forest, WildTheme.deepEmerald],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(24)
                .padding(.horizontal)

                // Audio Call Simulator
                if let callName = species.audioCallName {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Vocal Call Simulation")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.primary)

                            Text(callName.replacingOccurrences(of: "_", with: " ").capitalized)
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        AudioVisualizerView(isPlaying: isPlayingCall, barColor: WildTheme.leafGreen)
                            .padding(.trailing, 8)

                        Button(action: {
                            withAnimation {
                                isPlayingCall.toggle()
                            }
                        }) {
                            Image(systemName: isPlayingCall ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: 34))
                                .foregroundColor(WildTheme.leafGreen)
                        }
                    }
                    .padding(14)
                    .background(WildTheme.cardBackground)
                    .cornerRadius(16)
                    .padding(.horizontal)
                }

                // Species Summary
                VStack(alignment: .leading, spacing: 8) {
                    Text("Overview")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)

                    Text(species.summary)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.secondary)
                        .lineSpacing(4)
                }
                .padding(.horizontal)

                // Key Facts Matrix
                VStack(alignment: .leading, spacing: 12) {
                    Text("Key Characteristics")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        factTile(title: "Diet", value: species.diet, icon: "fork.knife")
                        factTile(title: "Lifespan", value: species.lifespan, icon: "hourglass")
                        factTile(title: "Weight", value: species.weight, icon: "scalemass.fill")
                        factTile(title: "Size", value: species.length, icon: "ruler.fill")
                    }
                }
                .padding(.horizontal)

                // Habitat & Geography
                VStack(alignment: .leading, spacing: 10) {
                    Text("Range & Habitat")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)

                    VStack(alignment: .leading, spacing: 8) {
                        Label(species.habitat, systemImage: "leaf.fill")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.primary)

                        Label(species.region, systemImage: "globe.americas.fill")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.secondary)
                    }
                    .padding(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(WildTheme.cardBackground)
                    .cornerRadius(16)
                }
                .padding(.horizontal)

                // Taxonomy Tree
                VStack(alignment: .leading, spacing: 10) {
                    Text("Taxonomic Classification")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)

                    VStack(spacing: 6) {
                        taxonomyRow(rank: "Kingdom", name: species.taxonomy.kingdom)
                        taxonomyRow(rank: "Phylum", name: species.taxonomy.phylum)
                        taxonomyRow(rank: "Class", name: species.taxonomy.class)
                        taxonomyRow(rank: "Order", name: species.taxonomy.order)
                        taxonomyRow(rank: "Family", name: species.taxonomy.family)
                        taxonomyRow(rank: "Genus", name: species.taxonomy.genus)
                    }
                    .padding(14)
                    .background(WildTheme.cardBackground)
                    .cornerRadius(16)
                }
                .padding(.horizontal)

                // Fun Facts
                if !species.funFacts.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Fascinating Facts")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)

                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(species.funFacts, id: \.self) { fact in
                                HStack(alignment: .top, spacing: 10) {
                                    Image(systemName: "sparkle")
                                        .font(.system(size: 12))
                                        .foregroundColor(WildTheme.amber)
                                        .padding(.top, 3)

                                    Text(fact)
                                        .font(.system(size: 13))
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding(14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(WildTheme.cardBackground)
                        .cornerRadius(16)
                    }
                    .padding(.horizontal)
                }

                // Conservation Threats
                if !species.threats.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Conservation Threats")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)

                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(species.threats, id: \.self) { threat in
                                HStack(spacing: 10) {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .font(.system(size: 12))
                                        .foregroundColor(species.conservationStatus.color)

                                    Text(threat)
                                        .font(.system(size: 13))
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding(14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(WildTheme.cardBackground)
                        .cornerRadius(16)
                    }
                    .padding(.horizontal)
                }

                // Log Button
                Button(action: { showingLogSheet = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Log Sighting of \(species.commonName)")
                    }
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(WildTheme.leafGreen)
                    .cornerRadius(16)
                }
                .padding(.horizontal)
                .padding(.bottom, 24)
            }
        }
        .background(WildTheme.background.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingLogSheet) {
            NewSightingSheet(prefilledSpecies: species)
        }
    }

    private func factTile(title: String, value: String, icon: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 12))
                    .foregroundColor(WildTheme.moss)
                Text(title)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.secondary)
            }
            Text(value)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.primary)
                .lineLimit(2)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(WildTheme.cardBackground)
        .cornerRadius(14)
    }

    private func taxonomyRow(rank: String, name: String) -> some View {
        HStack {
            Text(rank)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.secondary)
            Spacer()
            Text(name)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.primary)
        }
    }
}
