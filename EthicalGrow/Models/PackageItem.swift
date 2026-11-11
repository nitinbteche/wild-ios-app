import Foundation

public struct PackageItem: Identifiable, Codable, Hashable {
    public let id: UUID
    public let name: String
    public let subtitle: String
    public let price: Int
    public let originalPrice: Int
    public let badge: String?
    public let features: [String]
    public let includedCourses: [String]
    public let webUrl: String
    public let iconSymbol: String

    public var discountPercent: Int {
        guard originalPrice > 0 else { return 0 }
        return Int(((Double(originalPrice - price)) / Double(originalPrice)) * 100)
    }

    public init(
        id: UUID = UUID(),
        name: String,
        subtitle: String,
        price: Int,
        originalPrice: Int,
        badge: String? = nil,
        features: [String],
        includedCourses: [String],
        webUrl: String = "https://ethicalgrow.in/packages.php",
        iconSymbol: String = "cube.box.fill"
    ) {
        self.id = id
        self.name = name
        self.subtitle = subtitle
        self.price = price
        self.originalPrice = originalPrice
        self.badge = badge
        self.features = features
        self.includedCourses = includedCourses
        self.webUrl = webUrl
        self.iconSymbol = iconSymbol
    }
}
