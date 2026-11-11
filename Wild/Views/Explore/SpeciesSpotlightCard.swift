import SwiftUI

public struct SpeciesSpotlightCard: View {
    public let species: Species
    public let onNext: () -> Void

    public init(species: Species, onNext: @escaping () -> Void) {
        self.species = species
        self.onNext = onNext
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Label("DAILY SPOTLIGHT", systemImage: "sparkles")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(WildTheme.amber)
                    .tracking(1.2)

                Spacer()

                Button(action: onNext) {
                    HStack(spacing: 4) {
                        Text("Next")
                            .font(.system(size: 12, weight: .semibold))
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 14))
                    }
                    .foregroundColor(.white.opacity(0.85))
                }
            }

            HStack(alignment: .top, spacing: 16) {
                // Icon representation badge
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(
                            LinearGradient(
                                colors: [WildTheme.leafGreen.opacity(0.3), WildTheme.forest],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 72, height: 72)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )

                    Image(systemName: species.iconSymbol)
                        .font(.system(size: 32, weight: .medium))
                        .foregroundColor(.white)
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text(species.commonName)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text(species.scientificName)
                        .font(.system(size: 14, weight: .medium))
                        .italic()
                        .foregroundColor(.white.opacity(0.8))

                    HStack(spacing: 8) {
                        StatusBadge(status: species.conservationStatus, compact: true)

                        Text(species.region.components(separatedBy: "(").first?.trimmingCharacters(in: .whitespaces) ?? species.region)
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(.white.opacity(0.75))
                            .lineLimit(1)
                    }
                    .padding(.top, 2)
                }
            }

            Text(species.summary)
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(.white.opacity(0.9))
                .lineLimit(3)
                .lineSpacing(3)

            HStack {
                NavigationLink(destination: SpeciesDetailView(species: species)) {
                    Text("Explore Species Guide")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(WildTheme.leafGreen)
                        .cornerRadius(20)
                }

                Spacer()

                HStack(spacing: 4) {
                    Image(systemName: species.category.icon)
                    Text(species.category.rawValue)
                }
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding(18)
        .background(
            LinearGradient(
                colors: [WildTheme.forest, WildTheme.deepEmerald],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(24)
        .shadow(color: WildTheme.forest.opacity(0.35), radius: 12, x: 0, y: 6)
    }
}

public struct MigrationAlertCard: View {
    public let message: String

    public init(message: String) {
        self.message = message
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: "arrow.triangle.swap")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(WildTheme.amber)
                .padding(10)
                .background(WildTheme.amber.opacity(0.18))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text("SEASONAL MIGRATION RADAR")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(WildTheme.amber)
                    .tracking(1.0)

                Text(message)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.primary)
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding(14)
        .background(WildTheme.cardBackground)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(WildTheme.amber.opacity(0.3), lineWidth: 1)
        )
    }
}
