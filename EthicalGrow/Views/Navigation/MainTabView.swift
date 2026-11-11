import SwiftUI

public struct MainTabView: View {
    @State private var selectedTab = 0

    public init() {}

    public var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)

            PackagesListView()
                .tabItem {
                    Label("Packages", systemImage: "cube.box.fill")
                }
                .tag(1)

            CoursesListView()
                .tabItem {
                    Label("Courses", systemImage: "graduationcap.fill")
                }
                .tag(2)

            PresentationView()
                .tabItem {
                    Label("Plan", systemImage: "play.circle.fill")
                }
                .tag(3)

            WebPortalView(initialUrl: EthicalGrowData.loginUrl)
                .tabItem {
                    Label("Portal", systemImage: "person.badge.key.fill")
                }
                .tag(4)

            SupportView()
                .tabItem {
                    Label("Support", systemImage: "headphones")
                }
                .tag(5)
        }
        .accentColor(EthicalGrowTheme.primaryBlue)
    }
}
