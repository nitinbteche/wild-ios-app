import SwiftUI

public struct SightingAnnotationCard: View {
    public let sighting: Sighting
    public let onClose: () -> Void

    public init(sighting: Sighting, onClose: @escaping () -> Void) {
        self.sighting = sighting
        self.onClose = onClose
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                HStack(spacing: 5) {
                    Image(systemName: sighting.category.icon)
                    Text(sighting.category.rawValue)
                }
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(WildTheme.amber)

                Spacer()

                Button(action: onClose) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.secondary)
                }
            }

            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(WildTheme.leafGreen.opacity(0.18))
                        .frame(width: 44, height: 44)

                    Image(systemName: sighting.imageSymbol)
                        .font(.system(size: 22))
                        .foregroundColor(WildTheme.forest)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(sighting.speciesName)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.primary)

                    Text(sighting.locationName)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }

            HStack {
                Text(sighting.timestamp, style: .date)
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)

                Spacer()

                NavigationLink(destination: SightingDetailView(sighting: sighting)) {
                    Text("View Log")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(WildTheme.leafGreen)
                }
            }
        }
        .padding(14)
        .background(WildTheme.cardBackground)
        .cornerRadius(18)
        .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.primary.opacity(0.08), lineWidth: 1)
        )
    }
}
