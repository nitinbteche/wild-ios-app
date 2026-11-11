import SwiftUI

public struct JournalView: View {
    @StateObject private var viewModel = JournalViewModel()
    @EnvironmentObject private var dataStore: DataStore

    public init() {}

    public var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header Stats Bar
                HStack(spacing: 12) {
                    StatCounterCard(
                        title: "Total Sightings",
                        count: "\(viewModel.totalCount)",
                        iconSymbol: "book.closed.fill",
                        tintColor: WildTheme.leafGreen
                    )
                    StatCounterCard(
                        title: "Species Recorded",
                        count: "\(viewModel.uniqueSpeciesCount)",
                        iconSymbol: "checkmark.seal.fill",
                        tintColor: WildTheme.amber
                    )
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 6)

                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    TextField("Search sightings by species, location, notes...", text: $viewModel.searchText)
                        .font(.system(size: 14))
                    if !viewModel.searchText.isEmpty {
                        Button(action: { viewModel.searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(10)
                .background(WildTheme.cardBackground)
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.vertical, 6)

                // Category Pills
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        filterPill(title: "All", isSelected: viewModel.selectedFilterCategory == nil) {
                            viewModel.selectedFilterCategory = nil
                        }

                        ForEach(SpeciesCategory.allCases) { cat in
                            filterPill(
                                title: "\(cat.emoji) \(cat.rawValue)",
                                isSelected: viewModel.selectedFilterCategory == cat
                            ) {
                                if viewModel.selectedFilterCategory == cat {
                                    viewModel.selectedFilterCategory = nil
                                } else {
                                    viewModel.selectedFilterCategory = cat
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                }

                // Sightings List
                if viewModel.filteredSightings.isEmpty {
                    VStack(spacing: 14) {
                        Spacer()
                        Image(systemName: "binoculars")
                            .font(.system(size: 44))
                            .foregroundColor(.secondary)
                        Text("No Field Sightings Logged")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.primary)
                        Text("Tap '+' to record your first wildlife encounter in the wild.")
                            .font(.system(size: 13))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                        Button(action: { viewModel.isShowingNewSightingSheet = true }) {
                            Label("Log First Sighting", systemImage: "plus")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(WildTheme.leafGreen)
                                .cornerRadius(20)
                        }
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(viewModel.filteredSightings) { sighting in
                            NavigationLink(destination: SightingDetailView(sighting: sighting)) {
                                sightingRow(sighting: sighting)
                            }
                            .listRowBackground(WildTheme.cardBackground)
                            .listRowSeparatorTint(Color.primary.opacity(0.06))
                        }
                        .onDelete(perform: viewModel.delete)
                    }
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                }
            }
            .background(WildTheme.background.ignoresSafeArea())
            .navigationTitle("Field Journal")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { viewModel.isShowingNewSightingSheet = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(WildTheme.leafGreen)
                    }
                }
            }
            .sheet(isPresented: $viewModel.isShowingNewSightingSheet) {
                NewSightingSheet()
            }
        }
    }

    private func filterPill(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .foregroundColor(isSelected ? .white : .primary)
                .background(isSelected ? WildTheme.moss : WildTheme.cardBackground)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(isSelected ? Color.clear : Color.primary.opacity(0.08), lineWidth: 1)
                )
        }
    }

    private func sightingRow(sighting: Sighting) -> some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(WildTheme.moss.opacity(0.15))
                    .frame(width: 44, height: 44)

                Image(systemName: sighting.imageSymbol)
                    .font(.system(size: 20))
                    .foregroundColor(WildTheme.moss)
            }

            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text(sighting.speciesName)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.primary)

                    Spacer()

                    Text(sighting.timestamp, style: .date)
                        .font(.system(size: 11))
                        .foregroundColor(.secondary)
                }

                Text(sighting.locationName)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .lineLimit(1)

                if !sighting.notes.isEmpty {
                    Text(sighting.notes)
                        .font(.system(size: 11))
                        .foregroundColor(.secondary.opacity(0.85))
                        .lineLimit(1)
                }
            }
        }
        .padding(.vertical, 4)
    }
}
