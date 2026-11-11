import Foundation

// MARK: - Achievement Model
public struct Achievement: Identifiable, Codable, Hashable {
    public let id: UUID
    public let title: String
    public let detail: String
    public let iconSymbol: String
    public let requiredCount: Int
    public var currentProgress: Int
    public var isUnlocked: Bool
    public var unlockedDate: Date?

    public var progressFraction: Double {
        guard requiredCount > 0 else { return 0 }
        return min(1.0, Double(currentProgress) / Double(requiredCount))
    }

    public init(
        id: UUID = UUID(),
        title: String,
        detail: String,
        iconSymbol: String,
        requiredCount: Int,
        currentProgress: Int = 0,
        isUnlocked: Bool = false,
        unlockedDate: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.detail = detail
        self.iconSymbol = iconSymbol
        self.requiredCount = requiredCount
        self.currentProgress = currentProgress
        self.isUnlocked = isUnlocked
        self.unlockedDate = unlockedDate
    }
}
