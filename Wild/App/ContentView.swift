import SwiftUI

public struct ContentView: View {
    @StateObject private var dataStore = DataStore.shared
    @StateObject private var audioPlayer = AudioPlayerService.shared

    public init() {}

    public var body: some View {
        MainTabView()
            .environmentObject(dataStore)
            .environmentObject(audioPlayer)
    }
}
