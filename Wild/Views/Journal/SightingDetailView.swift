import SwiftUI
import MapKit

public struct SightingDetailView: View {
    public let sighting: Sighting
    @EnvironmentObject private var dataStore: DataStore
    @Environment(\.dismiss) private var dismiss

    public init(sighting: Sighting) {
        self.sighting = sighting
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                // Header Banner
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        HStack(spacing: 5) {
                            Image(systemName: sighting.category.icon)
                            Text(sighting.category.rawValue)
                        }
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(WildTheme.amber)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(WildTheme.amber.opacity(0.18))
                        .clipShape(Capsule())

                        Spacer()

                        Text(sighting.confidence.rawValue)
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.white.opacity(0.85))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.white.opacity(0.15))
                            .clipShape(Capsule())
                    }

                    HStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(WildTheme.leafGreen.opacity(0.3))
                                .frame(width: 68, height: 68)

                            Image(systemName: sighting.imageSymbol)
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(sighting.speciesName)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)

                            if !sighting.scientificName.isEmpty {
                                Text(sighting.scientificName)
                                    .font(.system(size: 14, weight: .medium))
                                    .italic()
                                    .foregroundColor(.white.opacity(0.8))
                            }

                            Text("\(sighting.count) individual(s) observed")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(WildTheme.sand)
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

                // Observation Metadata
                VStack(spacing: 12) {
                    metadataRow(icon: "calendar", title: "Date & Time", value: sighting.timestamp.formatted(date: .long, time: .shortened))
                    Divider()
                    metadataRow(icon: "mappin.and.ellipse", title: "Location", value: sighting.locationName)
                    Divider()
                    metadataRow(icon: "location.north.line.fill", title: "Coordinates", value: String(format: "%.4f, %.4f", sighting.latitude, sighting.longitude))
                    Divider()
                    metadataRow(icon: sighting.weather.icon, title: "Weather Condition", value: sighting.weather.rawValue)
                }
                .padding(16)
                .background(WildTheme.cardBackground)
                .cornerRadius(18)
                .padding(.horizontal)

                // Field Notes
                if !sighting.notes.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Field Notes")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)

                        Text(sighting.notes)
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(14)
                            .background(WildTheme.cardBackground)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal)
                }

                // Field Tags
                if !sighting.tags.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Tags")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(sighting.tags, id: \.self) { tag in
                                    Text(tag)
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(WildTheme.leafGreen)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(WildTheme.leafGreen.opacity(0.12))
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Delete Entry Button
                Button(role: .destructive, action: {
                    dataStore.deleteSighting(withId: sighting.id)
                    dismiss()
                }) {
                    Label("Delete Field Observation", systemImage: "trash")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(14)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 24)
            }
        }
        .background(WildTheme.background.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }

    private func metadataRow(icon: String, title: String, value: String) -> some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(WildTheme.moss)
                .frame(width: 24)

            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.secondary)

            Spacer()

            Text(value)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.primary)
                .multilineTextAlignment(.trailing)
        }
    }
}
