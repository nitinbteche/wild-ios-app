import Foundation
import Combine
import SwiftUI

public class AudioPlayerService: ObservableObject {
    public static let shared = AudioPlayerService()

    @Published public var isPlaying: Bool = false
    @Published public var currentSoundscape: Soundscape? = nil
    @Published public var playbackProgress: Double = 0.0
    @Published public var volume: Double = 0.8

    private var timer: Timer?

    public init() {}

    public func play(soundscape: Soundscape) {
        if currentSoundscape?.id == soundscape.id && isPlaying {
            pause()
            return
        }

        currentSoundscape = soundscape
        isPlaying = true
        playbackProgress = 0.0

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            guard let self = self, self.isPlaying else { return }
            if self.playbackProgress < 1.0 {
                self.playbackProgress += 0.015
            } else {
                self.playbackProgress = 0.0
            }
        }
    }

    public func togglePlayPause() {
        if isPlaying {
            pause()
        } else if let current = currentSoundscape {
            isPlaying = true
        } else if let first = MockDataLoader.sampleSoundscapes.first {
            play(soundscape: first)
        }
    }

    public func pause() {
        isPlaying = false
        timer?.invalidate()
        timer = nil
    }

    public func stop() {
        isPlaying = false
        playbackProgress = 0.0
        currentSoundscape = nil
        timer?.invalidate()
        timer = nil
    }
}
