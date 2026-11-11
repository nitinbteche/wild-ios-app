import SwiftUI

// MARK: - Color Hex Initializer
extension Color {
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
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

// MARK: - Wild Theme Colors
public struct WildTheme {
    // Primary nature palette
    public static let forest = Color(hex: "#1E3F20")
    public static let deepEmerald = Color(hex: "#0E2818")
    public static let moss = Color(hex: "#4A7C59")
    public static let pine = Color(hex: "#2C5E3B")
    public static let leafGreen = Color(hex: "#5C996B")

    // Earth & Accent
    public static let amber = Color(hex: "#E08D3C")
    public static let terracotta = Color(hex: "#C85A32")
    public static let sand = Color(hex: "#F4EBD9")
    public static let riverBlue = Color(hex: "#2B6CB0")
    public static let skyBlue = Color(hex: "#63B3ED")

    // UI Neutrals
    public static let darkBackground = Color(hex: "#0B140E")
    public static let darkCardBackground = Color(hex: "#142218")
    public static let darkCardSecondary = Color(hex: "#1E3024")
    public static let lightBackground = Color(hex: "#F7F9F6")
    public static let lightCardBackground = Color(hex: "#FFFFFF")

    // Dynamic semantic colors
    public static var background: Color {
        #if os(iOS)
        return Color(UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(red: 0.04, green: 0.08, blue: 0.05, alpha: 1.0)
                : UIColor(red: 0.96, green: 0.98, blue: 0.96, alpha: 1.0)
        })
        #else
        return darkBackground
        #endif
    }

    public static var cardBackground: Color {
        #if os(iOS)
        return Color(UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(red: 0.08, green: 0.14, blue: 0.10, alpha: 1.0)
                : UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        })
        #else
        return darkCardBackground
        #endif
    }
}
