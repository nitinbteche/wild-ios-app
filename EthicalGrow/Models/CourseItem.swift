import Foundation

public enum CourseCategory: String, Codable, CaseIterable, Identifiable {
    case all = "All Courses"
    case programming = "Coding & Tech"
    case design = "Design & Creative"
    case video = "Video & Content"
    case marketing = "Growth & Marketing"

    public var id: String { rawValue }

    public var iconSymbol: String {
        switch self {
        case .all: return "square.grid.2x2.fill"
        case .programming: return "chevron.left.forwardslash.chevron.right"
        case .design: return "paintbrush.fill"
        case .video: return "video.fill"
        case .marketing: return "chart.line.uptrend.xyaxis"
        }
    }
}

public struct CourseItem: Identifiable, Codable, Hashable {
    public let id: UUID
    public let title: String
    public let category: CourseCategory
    public let summary: String
    public let level: String
    public let duration: String
    public let rating: Double
    public let studentsCount: String
    public let syllabus: [String]
    public let iconSymbol: String
    public let webUrl: String

    public init(
        id: UUID = UUID(),
        title: String,
        category: CourseCategory,
        summary: String,
        level: String = "Beginner to Advanced",
        duration: String = "10+ Hours",
        rating: Double = 4.9,
        studentsCount: String = "2,500+",
        syllabus: [String],
        iconSymbol: String,
        webUrl: String = "https://ethicalgrow.in/courses.php"
    ) {
        self.id = id
        self.title = title
        self.category = category
        self.summary = summary
        self.level = level
        self.duration = duration
        self.rating = rating
        self.studentsCount = studentsCount
        self.syllabus = syllabus
        self.iconSymbol = iconSymbol
        self.webUrl = webUrl
    }
}
