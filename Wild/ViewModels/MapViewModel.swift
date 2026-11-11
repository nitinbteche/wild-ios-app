import Foundation
import Combine
import CoreLocation
import MapKit

public class MapViewModel: ObservableObject {
    @Published public var selectedCategory: SpeciesCategory? = nil
    @Published public var selectedSighting: Sighting? = nil
    @Published public var searchText: String = ""
    @Published public var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 30.0, longitude: 10.0),
        span: MKCoordinateSpan(latitudeDelta: 80.0, longitudeDelta: 120.0)
    )

    private var cancellables = Set<AnyCancellable>()
    private let dataStore: DataStore

    public init(dataStore: DataStore = .shared) {
        self.dataStore = dataStore
    }

    public var filteredSightings: [Sighting] {
        dataStore.sightings.filter { sighting in
            let matchesCategory = selectedCategory == nil || sighting.category == selectedCategory
            let matchesSearch = searchText.isEmpty ||
                sighting.speciesName.localizedCaseInsensitiveContains(searchText) ||
                sighting.locationName.localizedCaseInsensitiveContains(searchText)
            return matchesCategory && matchesSearch
        }
    }

    public func focusOn(sighting: Sighting) {
        selectedSighting = sighting
        region = MKCoordinateRegion(
            center: sighting.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 4.0, longitudeDelta: 4.0)
        )
    }

    public func resetToWorldView() {
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25.0, longitude: 0.0),
            span: MKCoordinateSpan(latitudeDelta: 80.0, longitudeDelta: 120.0)
        )
        selectedSighting = nil
    }
}
