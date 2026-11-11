import SwiftUI

public struct CourseCardView: View {
    public let course: CourseItem
    public let onSelect: () -> Void

    public init(course: CourseItem, onSelect: @escaping () -> Void) {
        self.course = course
        self.onSelect = onSelect
    }

    public var body: some View {
        Button(action: onSelect) {
            VStack(alignment: .leading, spacing: 12) {
                // Category icon & rating
                HStack {
                    ZStack {
                        Circle()
                            .fill(EthicalGrowTheme.primaryBlue.opacity(0.12))
                            .frame(width: 44, height: 44)

                        Image(systemName: course.iconSymbol)
                            .font(.system(size: 20))
                            .foregroundColor(EthicalGrowTheme.primaryBlue)
                    }

                    Spacer()

                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 11))
                            .foregroundColor(.orange)
                        Text(String(format: "%.1f", course.rating))
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(EthicalGrowTheme.darkText)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.orange.opacity(0.12))
                    .clipShape(Capsule())
                }

                // Title & Description
                VStack(alignment: .leading, spacing: 4) {
                    Text(course.title)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(EthicalGrowTheme.darkText)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)

                    Text(course.summary)
                        .font(.system(size: 12))
                        .foregroundColor(EthicalGrowTheme.muted)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }

                Spacer(minLength: 0)

                // Meta row: Duration & students
                HStack {
                    Label(course.duration, systemImage: "clock.fill")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(EthicalGrowTheme.muted)

                    Spacer()

                    Text(course.studentsCount + " Students")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(EthicalGrowTheme.primaryBlue)
                }
            }
            .padding(14)
            .background(EthicalGrowTheme.cardBackground)
            .cornerRadius(18)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(EthicalGrowTheme.border, lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.03), radius: 6, x: 0, y: 2)
        }
    }
}

public struct CourseDetailSheet: View {
    public let course: CourseItem
    @Environment(\.dismiss) private var dismiss

    public init(course: CourseItem) {
        self.course = course
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header Card
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Label(course.category.rawValue, systemImage: course.category.iconSymbol)
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(EthicalGrowTheme.primaryBlue)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(EthicalGrowTheme.primaryBlue.opacity(0.12))
                                .clipShape(Capsule())

                            Spacer()

                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                                Text(String(format: "%.1f", course.rating))
                                    .fontWeight(.bold)
                            }
                            .font(.system(size: 12))
                        }

                        Text(course.title)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)

                        Text(course.summary)
                            .font(.system(size: 14))
                            .foregroundColor(EthicalGrowTheme.muted)
                            .lineSpacing(3)

                        HStack(spacing: 16) {
                            statItem(title: "Duration", value: course.duration, icon: "clock.fill")
                            statItem(title: "Level", value: course.level, icon: "chart.bar.fill")
                            statItem(title: "Enrolled", value: course.studentsCount, icon: "person.2.fill")
                        }
                        .padding(.top, 4)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(EthicalGrowTheme.softBg)
                    .cornerRadius(20)
                    .padding(.horizontal)

                    // Syllabus Modules
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Course Curriculum")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)

                        VStack(spacing: 8) {
                            ForEach(Array(course.syllabus.enumerated()), id: \.offset) { index, mod in
                                HStack(alignment: .top, spacing: 12) {
                                    ZStack {
                                        Circle()
                                            .fill(EthicalGrowTheme.primaryBlue)
                                            .frame(width: 24, height: 24)
                                        Text("\(index + 1)")
                                            .font(.system(size: 11, weight: .bold))
                                            .foregroundColor(.white)
                                    }

                                    Text(mod)
                                        .font(.system(size: 13, weight: .medium))
                                        .foregroundColor(EthicalGrowTheme.darkText)
                                        .multilineTextAlignment(.leading)

                                    Spacer()
                                }
                                .padding(12)
                                .background(EthicalGrowTheme.cardBackground)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(EthicalGrowTheme.border, lineWidth: 1)
                                )
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Access via Package Button
                    VStack(spacing: 10) {
                        Button(action: {
                            if let url = URL(string: course.webUrl) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack {
                                Image(systemName: "cart.fill")
                                Text("Get Course on ethicalgrow.in")
                            }
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(EthicalGrowTheme.brandGradient)
                            .cornerRadius(14)
                        }

                        Text("Included inside EthicalGrow Bundles with certificate.")
                            .font(.system(size: 11))
                            .foregroundColor(EthicalGrowTheme.muted)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
            }
            .navigationTitle("Course Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }

    private func statItem(title: String, value: String, icon: String) -> some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 12))
                .foregroundColor(EthicalGrowTheme.primaryBlue)
            VStack(alignment: .leading, spacing: 1) {
                Text(title)
                    .font(.system(size: 9))
                    .foregroundColor(EthicalGrowTheme.muted)
                Text(value)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(EthicalGrowTheme.darkText)
            }
        }
    }
}
