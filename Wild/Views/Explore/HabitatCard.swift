import SwiftUI

public struct HabitatCard: View {
    public let habitat: Habitat

    public init(habitat: Habitat) {
        self.habitat = habitat
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: habitat.iconSymbol)
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: habitat.colorHex))
                    .frame(width: 36, height: 36)
                    .background(Color(hex: habitat.colorHex).opacity(0.15))
                    .clipShape(Circle())

                Spacer()

                Text(habitat.threatLevel.components(separatedBy: " ").first ?? "Threat")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.secondary)
            }

            Text(habitat.name)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.primary)
                .lineLimit(1)

            Text(habitat.climate)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.secondary)
                .lineLimit(2)

            Spacer()

            VStack(alignment: .leading, spacing: 4) {
                Text("Key Residents:")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.secondary)

                Text(habitat.representativeSpecies.prefix(2).joined(separator: ", "))
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(WildTheme.leafGreen)
                    .lineLimit(1)
            }
        }
        .padding(14)
        .frame(width: 220, height: 180)
        .background(WildTheme.cardBackground)
        .cornerRadius(18)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.primary.opacity(0.06), lineWidth: 1)
        )
    }
}
