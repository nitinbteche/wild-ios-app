import SwiftUI

public struct GradientButton: View {
    public let title: String
    public let iconSymbol: String?
    public let action: () -> Void

    public init(title: String, iconSymbol: String? = nil, action: @escaping () -> Void) {
        self.title = title
        self.iconSymbol = iconSymbol
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let icon = iconSymbol {
                    Image(systemName: icon)
                        .font(.system(size: 15, weight: .bold))
                }
                Text(title)
                    .font(.system(size: 15, weight: .bold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(EthicalGrowTheme.brandGradient)
            .cornerRadius(14)
            .shadow(color: EthicalGrowTheme.primaryBlue.opacity(0.35), radius: 8, x: 0, y: 4)
        }
    }
}

public struct StatBadge: View {
    public let count: String
    public let label: String
    public let iconSymbol: String
    public var accentColor: Color = EthicalGrowTheme.primaryBlue

    public init(count: String, label: String, iconSymbol: String, accentColor: Color = EthicalGrowTheme.primaryBlue) {
        self.count = count
        self.label = label
        self.iconSymbol = iconSymbol
        self.accentColor = accentColor
    }

    public var body: some View {
        VStack(spacing: 4) {
            Image(systemName: iconSymbol)
                .font(.system(size: 18))
                .foregroundColor(accentColor)
                .frame(width: 38, height: 38)
                .background(accentColor.opacity(0.12))
                .clipShape(Circle())

            Text(count)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(EthicalGrowTheme.darkText)

            Text(label)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(EthicalGrowTheme.muted)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(EthicalGrowTheme.cardBackground)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(EthicalGrowTheme.border, lineWidth: 1)
        )
    }
}
