import SwiftUI

public struct StatCounterCard: View {
    public let title: String
    public let count: String
    public let iconSymbol: String
    public let tintColor: Color

    public init(title: String, count: String, iconSymbol: String, tintColor: Color = WildTheme.moss) {
        self.title = title
        self.count = count
        self.iconSymbol = iconSymbol
        self.tintColor = tintColor
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: iconSymbol)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(tintColor)
                    .padding(8)
                    .background(tintColor.opacity(0.15))
                    .clipShape(Circle())
                Spacer()
            }

            Text(count)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .foregroundColor(.primary)

            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.secondary)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(WildTheme.cardBackground)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primary.opacity(0.06), lineWidth: 1)
        )
    }
}
