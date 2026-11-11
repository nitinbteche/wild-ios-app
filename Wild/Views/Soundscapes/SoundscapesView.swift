import SwiftUI

public struct SoundscapesView: View {
    @ObservedObject private var audioPlayer = AudioPlayerService.shared
    @EnvironmentObject private var dataStore: DataStore

    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Active Player Deck
                    VStack(spacing: 16) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("NOW PLAYING SOUNDSCAPE")
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundColor(WildTheme.leafGreen)
                                    .tracking(1.0)

                                Text(audioPlayer.currentSoundscape?.title ?? "Select a Nature Ambiance")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)

                                Text(audioPlayer.currentSoundscape?.subtitle ?? "High-definition acoustic ecology")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white.opacity(0.8))
                            }

                            Spacer()

                            AudioVisualizerView(
                                isPlaying: audioPlayer.isPlaying,
                                barColor: WildTheme.leafGreen
                            )
                        }

                        // Progress indicator bar
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(Color.white.opacity(0.2))
                                    .frame(height: 6)

                                RoundedRectangle(cornerRadius: 3)
                                    .fill(WildTheme.leafGreen)
                                    .frame(width: geo.size.width * audioPlayer.playbackProgress, height: 6)
                                    .animation(.linear(duration: 0.5), value: audioPlayer.playbackProgress)
                            }
                        }
                        .frame(height: 6)

                        // Playback Controls
                        HStack(spacing: 28) {
                            Button(action: {
                                audioPlayer.stop()
                            }) {
                                Image(systemName: "stop.fill")
                                    .font(.system(size: 18))
                                    .foregroundColor(.white.opacity(0.7))
                            }

                            Button(action: {
                                withAnimation(.spring()) {
                                    audioPlayer.togglePlayPause()
                                }
                            }) {
                                Image(systemName: audioPlayer.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                    .font(.system(size: 48))
                                    .foregroundColor(.white)
                            }

                            // Volume slider control
                            HStack(spacing: 8) {
                                Image(systemName: "speaker.wave.1.fill")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white.opacity(0.7))

                                Slider(value: $audioPlayer.volume, in: 0.0...1.0)
                                    .accentColor(WildTheme.leafGreen)
                                    .frame(width: 80)

                                Image(systemName: "speaker.wave.3.fill")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white.opacity(0.7))
                            }
                        }
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                            colors: [WildTheme.forest, WildTheme.deepEmerald],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(24)
                    .padding(.horizontal)
                    .padding(.top, 8)

                    // Soundscapes Catalog
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Wild Biome Audio Recordings")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                            .padding(.horizontal)

                        VStack(spacing: 12) {
                            ForEach(dataStore.soundscapes) { soundscape in
                                let isSelected = audioPlayer.currentSoundscape?.id == soundscape.id
                                Button(action: {
                                    withAnimation(.spring()) {
                                        audioPlayer.play(soundscape: soundscape)
                                    }
                                }) {
                                    HStack(spacing: 14) {
                                        ZStack {
                                            Circle()
                                                .fill(Color(hex: soundscape.ambientColorHex).opacity(0.2))
                                                .frame(width: 52, height: 52)

                                            Image(systemName: soundscape.iconSymbol)
                                                .font(.system(size: 22))
                                                .foregroundColor(Color(hex: soundscape.ambientColorHex))
                                        }

                                        VStack(alignment: .leading, spacing: 4) {
                                            HStack {
                                                Text(soundscape.title)
                                                    .font(.system(size: 15, weight: .bold))
                                                    .foregroundColor(.primary)

                                                Spacer()

                                                Text(soundscape.duration)
                                                    .font(.system(size: 11, weight: .semibold))
                                                    .foregroundColor(.secondary)
                                            }

                                            Text(soundscape.audioDescription)
                                                .font(.system(size: 12))
                                                .foregroundColor(.secondary)
                                                .lineLimit(2)
                                                .multilineTextAlignment(.leading)
                                        }

                                        Image(systemName: isSelected && audioPlayer.isPlaying ? "pause.fill" : "play.fill")
                                            .font(.system(size: 14))
                                            .foregroundColor(WildTheme.leafGreen)
                                            .frame(width: 32, height: 32)
                                            .background(WildTheme.leafGreen.opacity(0.12))
                                            .clipShape(Circle())
                                    }
                                    .padding(14)
                                    .background(WildTheme.cardBackground)
                                    .cornerRadius(18)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 18)
                                            .stroke(isSelected ? WildTheme.leafGreen : Color.primary.opacity(0.06), lineWidth: isSelected ? 2 : 1)
                                    )
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer(minLength: 20)
                }
            }
            .background(WildTheme.background.ignoresSafeArea())
            .navigationTitle("Soundscapes")
        }
    }
}
