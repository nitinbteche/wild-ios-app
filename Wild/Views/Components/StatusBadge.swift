import SwiftUI

public struct StatusBadge: View {
    public let status: ConservationStatus
    public var compact: Bool = false

    public init(status: ConservationStatus, compact: Bool = false) {
        self.status = status
        self.compact = compact
    }

    public var body: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(status.color)
                .frame(width: 7, height: 7)

            Text(compact ? status.code : status.rawValue)
                .font(.system(size: compact ? 11 : 12, weight: .bold))
                .foregroundColor(.primary)
        }
        .padding(.horizontal, compact ? 6 : 9)
        .padding(.vertical, 4)
        .background(status.color.opacity(0.18))
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(status.color.opacity(0.4), lineWidth: 1)
        )
    }
}
