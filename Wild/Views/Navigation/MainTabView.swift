import SwiftUI

public struct MainTabView: View {
    @State private var selectedTab: Int = 0

    public init() {}

    public var body: some View {
        TabView(selection: $selectedTab) {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "leaf.fill")
                }
                .tag(0)

            FieldGuideView()
                .tabItem {
                    Label("Guide", systemImage: "books.vertical.fill")
                }
                .tag(1)

            WildlifeMapView()
                .tabItem {
                    Label("Radar", systemImage: "map.fill")
                }
                .tag(2)

            JournalView()
                .tabItem {
                    Label("Journal", systemImage: "book.fill")
                }
                .tag(3)

            SoundscapesView()
                .tabItem {
                    Label("Acoustics", systemImage: "headphones")
                }
                .tag(4)

            ProfileView()
                .tabItem {
                    Label("Ranger", systemImage: "person.crop.circle.fill")
                }
                .tag(5)
        }
        .accentColor(WildTheme.leafGreen)
    }
}
