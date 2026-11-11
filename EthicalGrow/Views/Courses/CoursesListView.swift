import SwiftUI

public struct CoursesListView: View {
    @State private var searchText = ""
    @State private var selectedCategory: CourseCategory = .all
    @State private var selectedCourse: CourseItem? = nil

    public init() {}

    public var filteredCourses: [CourseItem] {
        EthicalGrowData.officialCourses.filter { course in
            let matchesCategory = (selectedCategory == .all || course.category == selectedCategory)
            let matchesSearch = searchText.isEmpty ||
                course.title.localizedCaseInsensitiveContains(searchText) ||
                course.summary.localizedCaseInsensitiveContains(searchText)
            return matchesCategory && matchesSearch
        }
    }

    public var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Search Input
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(EthicalGrowTheme.muted)
                    TextField("Search courses (Python, Photoshop, YouTube...)", text: $searchText)
                        .font(.system(size: 14))
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(EthicalGrowTheme.muted)
                        }
                    }
                }
                .padding(10)
                .background(EthicalGrowTheme.cardBackground)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(EthicalGrowTheme.border, lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.vertical, 8)

                // Category Filter Pills
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(CourseCategory.allCases) { cat in
                            Button(action: { selectedCategory = cat }) {
                                HStack(spacing: 5) {
                                    Image(systemName: cat.iconSymbol)
                                        .font(.system(size: 11))
                                    Text(cat.rawValue)
                                        .font(.system(size: 12, weight: .semibold))
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 7)
                                .foregroundColor(selectedCategory == cat ? .white : EthicalGrowTheme.darkText)
                                .background(selectedCategory == cat ? EthicalGrowTheme.primaryBlue : EthicalGrowTheme.cardBackground)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(selectedCategory == cat ? Color.clear : EthicalGrowTheme.border, lineWidth: 1)
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                }

                // Course Grid
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                        ForEach(filteredCourses) { course in
                            CourseCardView(course: course) {
                                selectedCourse = course
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                }
            }
            .background(EthicalGrowTheme.background.ignoresSafeArea())
            .navigationTitle("Courses")
            .sheet(item: $selectedCourse) { course in
                CourseDetailSheet(course: course)
            }
        }
    }
}
