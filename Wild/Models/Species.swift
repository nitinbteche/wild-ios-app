import Foundation
import SwiftUI

// MARK: - Species Category
public enum SpeciesCategory: String, Codable, CaseIterable, Identifiable {
    case mammal = "Mammals"
    case bird = "Birds"
    case reptile = "Reptiles"
    case amphibian = "Amphibians"
    case marine = "Marine Life"
    case insect = "Insects"

    public var id: String { rawValue }

    public var icon: String {
        switch self {
        case .mammal: return "pawprint.fill"
        case .bird: return "bird.fill"
        case .reptile: return "lizard.fill"
        case .amphibian: return "drop.triangle.fill"
        case .marine: return "water.waves"
        case .insect: return "ant.fill"
        }
    }

    public var emoji: String {
        switch self {
        case .mammal: return "🐾"
        case .bird: return "🦅"
        case .reptile: return "🦎"
        case .amphibian: return "🐸"
        case .marine: return "🐋"
        case .insect: return "🦋"
        }
    }
}

// MARK: - Conservation Status (IUCN)
public enum ConservationStatus: String, Codable, CaseIterable, Identifiable {
    case leastConcern = "Least Concern"
    case nearThreatened = "Near Threatened"
    case vulnerable = "Vulnerable"
    case endangered = "Endangered"
    case criticallyEndangered = "Critically Endangered"
    case extinctInWild = "Extinct in the Wild"

    public var id: String { rawValue }

    public var code: String {
        switch self {
        case .leastConcern: return "LC"
        case .nearThreatened: return "NT"
        case .vulnerable: return "VU"
        case .endangered: return "EN"
        case .criticallyEndangered: return "CR"
        case .extinctInWild: return "EW"
        }
    }

    public var color: Color {
        switch self {
        case .leastConcern: return Color(red: 0.22, green: 0.65, blue: 0.38)
        case .nearThreatened: return Color(red: 0.38, green: 0.72, blue: 0.55)
        case .vulnerable: return Color(red: 0.95, green: 0.68, blue: 0.18)
        case .endangered: return Color(red: 0.93, green: 0.42, blue: 0.18)
        case .criticallyEndangered: return Color(red: 0.86, green: 0.22, blue: 0.22)
        case .extinctInWild: return Color(red: 0.45, green: 0.15, blue: 0.55)
        }
    }
}

// MARK: - Taxonomy
public struct Taxonomy: Codable, Hashable {
    public let kingdom: String
    public let phylum: String
    public let `class`: String
    public let order: String
    public let family: String
    public let genus: String

    public init(
        kingdom: String = "Animalia",
        phylum: String = "Chordata",
        class: String,
        order: String,
        family: String,
        genus: String
    ) {
        self.kingdom = kingdom
        self.phylum = phylum
        self.class = `class`
        self.order = order
        self.family = family
        self.genus = genus
    }
}

// MARK: - Species Model
public struct Species: Identifiable, Codable, Hashable {
    public let id: UUID
    public let commonName: String
    public let scientificName: String
    public let category: SpeciesCategory
    public let conservationStatus: ConservationStatus
    public let habitat: String
    public let region: String
    public let diet: String
    public let lifespan: String
    public let weight: String
    public let length: String
    public let summary: String
    public let funFacts: [String]
    public let threats: [String]
    public let iconSymbol: String
    public let heroImageName: String
    public let taxonomy: Taxonomy
    public let isFeatured: Bool
    public let audioCallName: String?

    public init(
        id: UUID = UUID(),
        commonName: String,
        scientificName: String,
        category: SpeciesCategory,
        conservationStatus: ConservationStatus,
        habitat: String,
        region: String,
        diet: String,
        lifespan: String,
        weight: String,
        length: String,
        summary: String,
        funFacts: [String],
        threats: [String],
        iconSymbol: String,
        heroImageName: String,
        taxonomy: Taxonomy,
        isFeatured: Bool = false,
        audioCallName: String? = nil
    ) {
        self.id = id
        self.commonName = commonName
        self.scientificName = scientificName
        self.category = category
        self.conservationStatus = conservationStatus
        self.habitat = habitat
        self.region = region
        self.diet = diet
        self.lifespan = lifespan
        self.weight = weight
        self.length = length
        self.summary = summary
        self.funFacts = funFacts
        self.threats = threats
        self.iconSymbol = iconSymbol
        self.heroImageName = heroImageName
        self.taxonomy = taxonomy
        self.isFeatured = isFeatured
        self.audioCallName = audioCallName
    }
}
