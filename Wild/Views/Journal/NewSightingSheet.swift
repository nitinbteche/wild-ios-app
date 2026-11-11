import SwiftUI
import CoreLocation

public struct NewSightingSheet: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var dataStore: DataStore

    public var prefilledSpecies: Species? = nil

    @State private var speciesName: String = ""
    @State private var scientificName: String = ""
    @State private var category: SpeciesCategory = .mammal
    @State private var timestamp: Date = Date()
    @State private var locationName: String = ""
    @State private var latitudeText: String = "26.0173"
    @State private var longitudeText: String = "76.5026"
    @State private var weather: WeatherCondition = .sunny
    @State private var confidence: ConfidenceLevel = .confirmed
    @State private var count: Int = 1
    @State private var notes: String = ""
    @State private var tagText: String = ""

    public init(prefilledSpecies: Species? = nil) {
        self.prefilledSpecies = prefilledSpecies
    }

    public var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Species Details")) {
                    TextField("Species Common Name (e.g. Bengal Tiger)", text: $speciesName)
                    TextField("Scientific Name (Optional)", text: $scientificName)

                    Picker("Category", selection: $category) {
                        ForEach(SpeciesCategory.allCases) { cat in
                            Label(cat.rawValue, systemImage: cat.icon).tag(cat)
                        }
                    }

                    Stepper("Count Observed: \(count)", value: $count, in: 1...5000)
                }

                Section(header: Text("Encounter Time & Location")) {
                    DatePicker("Date & Time", selection: $timestamp)

                    TextField("Location Name (e.g. Ranthambore Zone 3)", text: $locationName)

                    HStack {
                        TextField("Latitude", text: $latitudeText)
                            .keyboardType(.numbersAndPunctuation)
                        Divider()
                        TextField("Longitude", text: $longitudeText)
                            .keyboardType(.numbersAndPunctuation)
                    }

                    Button(action: simulateCurrentLocation) {
                        Label("Use Current GPS Coordinates", systemImage: "location.fill")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(WildTheme.leafGreen)
                    }
                }

                Section(header: Text("Environment & Confidence")) {
                    Picker("Weather Condition", selection: $weather) {
                        ForEach(WeatherCondition.allCases) { w in
                            Label(w.rawValue, systemImage: w.icon).tag(w)
                        }
                    }

                    Picker("Observation Confidence", selection: $confidence) {
                        ForEach(ConfidenceLevel.allCases) { conf in
                            Text(conf.rawValue).tag(conf)
                        }
                    }
                }

                Section(header: Text("Field Notes & Tags")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 80)

                    TextField("Tags (comma separated, e.g. #Breeding, #Morning)", text: $tagText)
                }
            }
            .navigationTitle("Log Sighting")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save Entry") {
                        saveSighting()
                    }
                    .disabled(speciesName.trimmingCharacters(in: .whitespaces).isEmpty)
                    .fontWeight(.bold)
                }
            }
            .onAppear {
                if let prefilled = prefilledSpecies {
                    speciesName = prefilled.commonName
                    scientificName = prefilled.scientificName
                    category = prefilled.category
                }
            }
        }
    }

    private func simulateCurrentLocation() {
        latitudeText = String(format: "%.4f", Double.random(in: 20.0...50.0))
        longitudeText = String(format: "%.4f", Double.random(in: -120.0...80.0))
        if locationName.isEmpty {
            locationName = "Field Waypoint \(Int.random(in: 101...999))"
        }
    }

    private func saveSighting() {
        let lat = Double(latitudeText) ?? 26.0173
        let lon = Double(longitudeText) ?? 76.5026

        let tags = tagText
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }

        let newSighting = Sighting(
            speciesName: speciesName.trimmingCharacters(in: .whitespaces),
            scientificName: scientificName.trimmingCharacters(in: .whitespaces),
            category: category,
            timestamp: timestamp,
            latitude: lat,
            longitude: lon,
            locationName: locationName.isEmpty ? "Field Observation" : locationName,
            weather: weather,
            notes: notes,
            tags: tags,
            confidence: confidence,
            count: count,
            imageSymbol: category.icon
        )

        dataStore.addSighting(newSighting)
        dismiss()
    }
}
