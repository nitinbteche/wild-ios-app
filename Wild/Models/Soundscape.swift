import Foundation

// MARK: - Soundscape Model
public struct Soundscape: Identifiable, Codable, Hashable {
    public let id: UUID
    public let title: String
    public let subtitle: String
    public let duration: String
    public let environment: String
    public let iconSymbol: String
    public let audioDescription: String
    public let ambientColorHex: String

    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        duration: String,
        environment: String,
        iconSymbol: String,
        audioDescription: String,
        ambientColorHex: String
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.duration = duration
        self.environment = environment
        self.iconSymbol = iconSymbol
        self.audioDescription = audioDescription
        self.ambientColorHex = ambientColorHex
    }
}
