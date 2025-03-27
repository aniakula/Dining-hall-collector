import MapKit
import SwiftUI

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    let loc: CLLocationCoordinate2D
    private var region: MKCoordinateRegion{
        MKCoordinateRegion(
            center: loc,
            span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        )
    }
}

#Preview {
    MapView(loc: .accenture)
}
