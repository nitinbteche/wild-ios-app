import Foundation

public struct FAQItem: Identifiable, Codable, Hashable {
    public let id: UUID
    public let question: String
    public let answer: String

    public init(id: UUID = UUID(), question: String, answer: String) {
        self.id = id
        self.question = question
        self.answer = answer
    }
}

public struct FounderItem: Identifiable, Hashable {
    public let id: UUID
    public let name: String
    public let role: String
    public let message: String
    public let city: String
    public let iconSymbol: String

    public init(
        id: UUID = UUID(),
        name: String,
        role: String,
        message: String,
        city: String = "Moradabad, Uttar Pradesh",
        iconSymbol: String = "person.fill"
    ) {
        self.id = id
        self.name = name
        self.role = role
        self.message = message
        self.city = city
        self.iconSymbol = iconSymbol
    }
}
