import Foundation
import CoreLocation

// MARK: - Weather Condition
public enum WeatherCondition: String, Codable, CaseIterable, Identifiable {
    case sunny = "Sunny / Clear"
    case partlyCloudy = "Partly Cloudy"
    case overcast = "Overcast"
    case lightRain = "Light Rain"
    case heavyRain = "Heavy Rain"
    case foggy = "Foggy / Mist"
    case snowy = "Snow / Sleet"

    public var id: String { rawValue }

    public var icon: String {
        switch self {
        case .sunny: return "sun.max.fill"
        case .partlyCloudy: return "cloud.sun.fill"
        case .overcast: return "cloud.fill"
        case .lightRain: return "cloud.drizzle.fill"
        case .heavyRain: return "cloud.heavyrain.fill"
        case .foggy: return "cloud.fog.fill"
        case .snowy: return "snowflake"
        }
    }
}

// MARK: - Confidence Level
public enum ConfidenceLevel: String, Codable, CaseIterable, Identifiable {
    case confirmed = "Confirmed (100%)"
    case probable = "Probable (>80%)"
    case possible = "Possible (<50%)"

    public var id: String { rawValue }

    public var badgeColorHex: String {
        switch self {
        case .confirmed: return "#34C759"
        case .probable: return "#FF9500"
        case .possible: return "#5856D6"
        }
    }
}

// MARK: - Sighting Model
public struct Sighting: Identifiable, Codable, Hashable {
    public let id: UUID
    public var speciesName: String
    public var scientificName: String
    public var category: SpeciesCategory
    public var timestamp: Date
    public var latitude: Double
    public var longitude: Double
    public var locationName: String
    public var weather: WeatherCondition
    public var notes: String
    public var tags: [String]
    public var confidence: ConfidenceLevel
    public var count: Int
    public var imageSymbol: String

    public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    public init(
        id: UUID = UUID(),
        speciesName: String,
        scientificName: String,
        category: SpeciesCategory,
        timestamp: Date = Date(),
        latitude: Double,
        longitude: Double,
        locationName: String,
        weather: WeatherCondition = .sunny,
        notes: String = "",
        tags: [String] = [],
        confidence: ConfidenceLevel = .confirmed,
        count: Int = 1,
        imageSymbol: String = "camera.fill"
    ) {
        self.id = id
        self.speciesName = speciesName
        self.scientificName = scientificName
        self.category = category
        self.timestamp = timestamp
        self.latitude = latitude
        self.longitude = longitude
        self.locationName = locationName
        self.weather = weather
        self.notes = notes
        self.tags = tags
        self.confidence = confidence
        self.count = count
        self.imageSymbol = imageSymbol
    }
}
