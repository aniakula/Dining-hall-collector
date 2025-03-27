import Foundation
import SwiftUI
import CoreLocation

struct Location{
    let name: String
    var description: String
    let image: Image
    let coords: CLLocationCoordinate2D
    var isFound: Bool = false
}
