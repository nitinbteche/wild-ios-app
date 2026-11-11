import SwiftUI

public struct HabitatTag: View {
    public let text: String
    public let iconSymbol: String?
    public var accentColor: Color = WildTheme.moss

    public init(text: String, iconSymbol: String? = nil, accentColor: Color = WildTheme.moss) {
        self.text = text
        self.iconSymbol = iconSymbol
        self.accentColor = accentColor
    }

    public var body: some View {
        HStack(spacing: 5) {
            if let icon = iconSymbol {
                Image(systemName: icon)
                    .font(.system(size: 11, weight: .semibold))
            }
            Text(text)
                .font(.system(size: 12, weight: .medium))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .foregroundColor(accentColor)
        .background(accentColor.opacity(0.12))
        .clipShape(Capsule())
    }
}

public struct AudioVisualizerView: View {
    public let isPlaying: Bool
    public var barColor: Color = WildTheme.leafGreen

    @State private var heights: [CGFloat] = [8, 14, 20, 12, 18, 6]

    public init(isPlaying: Bool, barColor: Color = WildTheme.leafGreen) {
        self.isPlaying = isPlaying
        self.barColor = barColor
    }

    public var body: some View {
        HStack(spacing: 3) {
            ForEach(0..<heights.count, id: \.self) { index in
                RoundedRectangle(cornerRadius: 2)
                    .fill(barColor)
                    .frame(width: 3, height: isPlaying ? heights[index] : 4)
                    .animation(
                        isPlaying ? Animation.easeInOut(duration: 0.35 + Double(index) * 0.08)
                            .repeatForever(autoreverses: true) : .default,
                        value: heights[index]
                    )
            }
        }
        .frame(height: 22)
        .onAppear {
            if isPlaying {
                randomizeHeights()
            }
        }
        .onChange(of: isPlaying) { playing in
            if playing {
                randomizeHeights()
            }
        }
    }

    private func randomizeHeights() {
        heights = [16, 22, 10, 24, 14, 18]
    }
}
