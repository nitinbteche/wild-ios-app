import SwiftUI

public struct FieldGuideView: View {
    @StateObject private var viewModel = FieldGuideViewModel()
    @EnvironmentObject private var dataStore: DataStore

    public init() {}

    public var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Search Bar & Filter trigger
                HStack(spacing: 10) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search species, scientific name, habitat...", text: $viewModel.searchText)
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

                    Button(action: { viewModel.isFilterSheetPresented = true }) {
                        Image(systemName: viewModel.hasActiveFilters ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                            .font(.system(size: 24))
                            .foregroundColor(viewModel.hasActiveFilters ? WildTheme.leafGreen : .secondary)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)

                // Category Filter Pills
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        filterPill(title: "All", isSelected: viewModel.selectedCategory == nil) {
                            viewModel.selectedCategory = nil
                        }

                        ForEach(SpeciesCategory.allCases) { category in
                            filterPill(
                                title: "\(category.emoji) \(category.rawValue)",
                                isSelected: viewModel.selectedCategory == category
                            ) {
                                if viewModel.selectedCategory == category {
                                    viewModel.selectedCategory = nil
                                } else {
                                    viewModel.selectedCategory = category
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                }

                // Species List
                if viewModel.filteredSpecies.isEmpty {
                    VStack(spacing: 12) {
                        Spacer()
                        Image(systemName: "pawprint.circle")
                            .font(.system(size: 48))
                            .foregroundColor(.secondary)
                        Text("No wildlife matches found")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.primary)
                        Text("Try modifying your search or clearing active filters.")
                            .font(.system(size: 13))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Button("Reset Filters") {
                            viewModel.clearFilters()
                        }
                        .foregroundColor(WildTheme.leafGreen)
                        Spacer()
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.filteredSpecies) { species in
                                NavigationLink(destination: SpeciesDetailView(species: species)) {
                                    speciesRowCard(species: species)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    }
                }
            }
            .background(WildTheme.background.ignoresSafeArea())
            .navigationTitle("Field Guide")
            .sheet(isPresented: $viewModel.isFilterSheetPresented) {
                SpeciesFilterSheet(viewModel: viewModel)
            }
        }
    }

    private func filterPill(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .padding(.horizontal, 12)
                .padding(.vertical, 7)
                .foregroundColor(isSelected ? .white : .primary)
                .background(isSelected ? WildTheme.leafGreen : WildTheme.cardBackground)
                .cornerRadius(18)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(isSelected ? Color.clear : Color.primary.opacity(0.08), lineWidth: 1)
                )
        }
    }

    private func speciesRowCard(species: Species) -> some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(WildTheme.moss.opacity(0.16))
                    .frame(width: 58, height: 58)

                Image(systemName: species.iconSymbol)
                    .font(.system(size: 26))
                    .foregroundColor(WildTheme.moss)
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(species.commonName)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.primary)

                    Spacer()

                    StatusBadge(status: species.conservationStatus, compact: true)
                }

                Text(species.scientificName)
                    .font(.system(size: 12, weight: .medium))
                    .italic()
                    .foregroundColor(.secondary)

                HStack(spacing: 6) {
                    Text(species.region.components(separatedBy: "(").first?.trimmingCharacters(in: .whitespaces) ?? species.region)
                        .font(.system(size: 11))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }
        }
        .padding(14)
        .background(WildTheme.cardBackground)
        .cornerRadius(18)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.primary.opacity(0.06), lineWidth: 1)
        )
    }
}
