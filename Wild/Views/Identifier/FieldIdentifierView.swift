import SwiftUI

public struct FieldIdentifierView: View {
    @EnvironmentObject private var dataStore: DataStore
    @State private var isScanning = false
    @State private var scanProgress: Double = 0.0
    @State private var identifiedSpecies: Species? = nil
    @State private var confidenceScore: Int = 94

    public init() {}

    public var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Viewfinder Box
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(WildTheme.darkCardBackground)
                        .frame(height: 280)

                    // Reticle grid marks
                    VStack {
                        HStack {
                            cornerMark(rotation: 0)
                            Spacer()
                            cornerMark(rotation: 90)
                        }
                        Spacer()
                        HStack {
                            cornerMark(rotation: 270)
                            Spacer()
                            cornerMark(rotation: 180)
                        }
                    }
                    .padding(24)
                    .frame(height: 280)

                    // Target Subject
                    VStack(spacing: 12) {
                        Image(systemName: identifiedSpecies?.iconSymbol ?? "camera.viewfinder")
                            .font(.system(size: isScanning ? 64 : 54))
                            .foregroundColor(isScanning ? WildTheme.leafGreen : .white.opacity(0.8))
                            .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: isScanning)

                        if isScanning {
                            Text("Analyzing morphological features...")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(WildTheme.leafGreen)
                        } else if identifiedSpecies != nil {
                            Text("Subject Locked & Identified")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(WildTheme.leafGreen)
                        } else {
                            Text("Point camera at wildlife subject")
                                .font(.system(size: 13))
                                .foregroundColor(.white.opacity(0.7))
                        }
                    }
                }
                .padding(.horizontal)

                // Trigger Scan Simulation Button
                Button(action: startScanSimulation) {
                    HStack(spacing: 8) {
                        Image(systemName: isScanning ? "hourglass" : "sparkles")
                        Text(isScanning ? "Processing..." : "Run AI Species Recognition")
                    }
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(isScanning ? Color.gray : WildTheme.leafGreen)
                    .cornerRadius(16)
                }
                .disabled(isScanning)
                .padding(.horizontal)

                // Results Card
                if let species = identifiedSpecies {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Label("TOP MATCH", systemImage: "checkmark.seal.fill")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(WildTheme.leafGreen)
                                .tracking(1.0)

                            Spacer()

                            Text("\(confidenceScore)% Match")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(WildTheme.leafGreen)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(WildTheme.leafGreen.opacity(0.15))
                                .clipShape(Capsule())
                        }

                        HStack(spacing: 14) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(WildTheme.forest)
                                    .frame(width: 52, height: 52)

                                Image(systemName: species.iconSymbol)
                                    .font(.system(size: 26))
                                    .foregroundColor(.white)
                            }

                            VStack(alignment: .leading, spacing: 3) {
                                Text(species.commonName)
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .foregroundColor(.primary)

                                Text(species.scientificName)
                                    .font(.system(size: 13))
                                    .italic()
                                    .foregroundColor(.secondary)
                            }

                            Spacer()
                        }

                        HStack {
                            NavigationLink(destination: SpeciesDetailView(species: species)) {
                                Text("View Field Guide Entry")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(WildTheme.leafGreen)
                            }

                            Spacer()

                            NavigationLink(destination: NewSightingSheet(prefilledSpecies: species)) {
                                Text("Log Sighting")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 6)
                                    .background(WildTheme.leafGreen)
                                    .cornerRadius(14)
                            }
                        }
                    }
                    .padding(16)
                    .background(WildTheme.cardBackground)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(WildTheme.leafGreen.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }

                Spacer()
            }
            .background(WildTheme.background.ignoresSafeArea())
            .navigationTitle("AI Identifier")
        }
    }

    private func cornerMark(rotation: Double) -> some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 16))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 16, y: 0))
        }
        .stroke(WildTheme.leafGreen, lineWidth: 3)
        .frame(width: 16, height: 16)
        .rotationEffect(.degrees(rotation))
    }

    private func startScanSimulation() {
        isScanning = true
        identifiedSpecies = nil
        confidenceScore = Int.random(in: 88...98)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            isScanning = false
            let randomSpecies = dataStore.species.randomElement() ?? MockDataLoader.sampleSpecies[0]
            withAnimation(.spring()) {
                identifiedSpecies = randomSpecies
            }
        }
    }
}
