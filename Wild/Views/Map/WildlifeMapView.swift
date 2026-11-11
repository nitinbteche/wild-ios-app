import SwiftUI
import MapKit

public struct WildlifeMapView: View {
    @StateObject private var viewModel = MapViewModel()
    @EnvironmentObject private var dataStore: DataStore

    public init() {}

    public var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // Interactive Map View
                Map(
                    coordinateRegion: $viewModel.region,
                    annotationItems: viewModel.filteredSightings
                ) { sighting in
                    MapAnnotation(coordinate: sighting.coordinate) {
                        Button(action: {
                            withAnimation(.spring()) {
                                viewModel.focusOn(sighting: sighting)
                            }
                        }) {
                            VStack(spacing: 0) {
                                ZStack {
                                    Circle()
                                        .fill(WildTheme.forest)
                                        .frame(width: 36, height: 36)
                                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)

                                    Image(systemName: sighting.imageSymbol)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.white)
                                }

                                Image(systemName: "triangle.fill")
                                    .font(.system(size: 8))
                                    .foregroundColor(WildTheme.forest)
                                    .rotationEffect(.degrees(180))
                                    .offset(y: -2)
                            }
                        }
                    }
                }
                .ignoresSafeArea(edges: .top)

                // Top Controls Overlay
                VStack(spacing: 8) {
                    // Category filter pill row
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            filterButton(title: "All", isSelected: viewModel.selectedCategory == nil) {
                                viewModel.selectedCategory = nil
                            }

                            ForEach(SpeciesCategory.allCases) { cat in
                                filterButton(
                                    title: "\(cat.emoji) \(cat.rawValue)",
                                    isSelected: viewModel.selectedCategory == cat
                                ) {
                                    if viewModel.selectedCategory == cat {
                                        viewModel.selectedCategory = nil
                                    } else {
                                        viewModel.selectedCategory = cat
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                    }
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .padding(.horizontal)
                    .padding(.top, 8)

                    Spacer()

                    // Recenter Floating Button
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()) {
                                viewModel.resetToWorldView()
                            }
                        }) {
                            Image(systemName: "globe.americas.fill")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.primary)
                                .frame(width: 44, height: 44)
                                .background(WildTheme.cardBackground)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                        .padding(.trailing, 16)
                    }

                    // Selected Sighting Bottom Callout Card
                    if let selected = viewModel.selectedSighting {
                        SightingAnnotationCard(sighting: selected) {
                            withAnimation(.spring()) {
                                viewModel.selectedSighting = nil
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 16)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                }
            }
            .navigationTitle("Wildlife Radar")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func filterButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .foregroundColor(isSelected ? .white : .primary)
                .background(isSelected ? WildTheme.leafGreen : Color.clear)
                .clipShape(Capsule())
        }
    }
}
