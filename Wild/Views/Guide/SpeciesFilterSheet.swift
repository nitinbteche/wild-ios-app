import SwiftUI

public struct SpeciesFilterSheet: View {
    @ObservedObject var viewModel: FieldGuideViewModel
    @Environment(\.dismiss) private var dismiss

    public init(viewModel: FieldGuideViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Filter by Class / Group")) {
                    Button(action: { viewModel.selectedCategory = nil }) {
                        HStack {
                            Text("All Classes")
                            Spacer()
                            if viewModel.selectedCategory == nil {
                                Image(systemName: "checkmark")
                                    .foregroundColor(WildTheme.leafGreen)
                            }
                        }
                    }
                    .foregroundColor(.primary)

                    ForEach(SpeciesCategory.allCases) { cat in
                        Button(action: { viewModel.selectedCategory = cat }) {
                            HStack {
                                Label(cat.rawValue, systemImage: cat.icon)
                                Spacer()
                                if viewModel.selectedCategory == cat {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(WildTheme.leafGreen)
                                }
                            }
                        }
                        .foregroundColor(.primary)
                    }
                }

                Section(header: Text("IUCN Conservation Status")) {
                    Button(action: { viewModel.selectedStatus = nil }) {
                        HStack {
                            Text("All Statuses")
                            Spacer()
                            if viewModel.selectedStatus == nil {
                                Image(systemName: "checkmark")
                                    .foregroundColor(WildTheme.leafGreen)
                            }
                        }
                    }
                    .foregroundColor(.primary)

                    ForEach(ConservationStatus.allCases) { status in
                        Button(action: { viewModel.selectedStatus = status }) {
                            HStack {
                                Circle()
                                    .fill(status.color)
                                    .frame(width: 8, height: 8)
                                Text(status.rawValue)
                                Spacer()
                                if viewModel.selectedStatus == status {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(WildTheme.leafGreen)
                                }
                            }
                        }
                        .foregroundColor(.primary)
                    }
                }

                Section {
                    Toggle(isOn: $viewModel.showOnlyBookmarks) {
                        Label("Saved Bookmarks Only", systemImage: "bookmark.fill")
                    }
                }

                Section {
                    Button("Reset All Filters", role: .destructive) {
                        viewModel.clearFilters()
                    }
                }
            }
            .navigationTitle("Filter Species")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
