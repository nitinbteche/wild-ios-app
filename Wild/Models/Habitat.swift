import Foundation

// MARK: - Habitat Model
public struct Habitat: Identifiable, Codable, Hashable {
    public let id: UUID
    public let name: String
    public let climate: String
    public let coverage: String
    public let keyFeatures: [String]
    public let threatLevel: String
    public let representativeSpecies: [String]
    public let iconSymbol: String
    public let colorHex: String

    public init(
        id: UUID = UUID(),
        name: String,
        climate: String,
        coverage: String,
        keyFeatures: [String],
        threatLevel: String,
        representativeSpecies: [String],
        iconSymbol: String,
        colorHex: String
    ) {
        self.id = id
        self.name = name
        self.climate = climate
        self.coverage = coverage
        self.keyFeatures = keyFeatures
        self.threatLevel = threatLevel
        self.representativeSpecies = representativeSpecies
        self.iconSymbol = iconSymbol
        self.colorHex = colorHex
    }
}
