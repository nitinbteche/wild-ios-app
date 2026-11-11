import SwiftUI

// MARK: - Color Hex Initializer
extension Color {
    public init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - EthicalGrow Official Theme
public struct EthicalGrowTheme {
    // Official Palette from ethicalgrow.in
    public static let primaryBlue = Color(hexString: "#1565C0")
    public static let blueDark = Color(hexString: "#0D47A1")
    public static let purple = Color(hexString: "#8E24AA")
    public static let pink = Color(hexString: "#D81B60")
    public static let green = Color(hexString: "#059669")
    public static let darkText = Color(hexString: "#0F172A")
    public static let muted = Color(hexString: "#64748B")
    public static let border = Color(hexString: "#E2E8F0")
    public static let softBg = Color(hexString: "#F8FAFC")
    public static let whatsappGreen = Color(hexString: "#25D366")

    // The signature EthicalGrow Brand Gradient
    public static let brandGradient = LinearGradient(
        colors: [
            Color(hexString: "#1565C0"),
            Color(hexString: "#8E24AA"),
            Color(hexString: "#D81B60")
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    // Reverse gradient for buttons / accents
    public static let accentGradient = LinearGradient(
        colors: [
            Color(hexString: "#0D6EFD"),
            Color(hexString: "#8B39F7")
        ],
        startPoint: .leading,
        endPoint: .trailing
    )

    public static var background: Color {
        #if os(iOS)
        return Color(UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(red: 0.06, green: 0.09, blue: 0.16, alpha: 1.0)
                : UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1.0)
        })
        #else
        return softBg
        #endif
    }

    public static var cardBackground: Color {
        #if os(iOS)
        return Color(UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(red: 0.10, green: 0.14, blue: 0.22, alpha: 1.0)
                : UIColor.white
        })
        #else
        return Color.white
        #endif
    }
}
