//
//  DiningHallViewModel.swift
//  dining_hall_collector
//
//  Created by Bruno Ndiba Mbwaye Roy on 3/28/25.
//
import SwiftUI

@Observable class DiningHallViewModel: ObservableObject {
    var locations: [Location] = Location.locs
    var collectedHalls: Set<String> = []

    func isCollected(_ hall: Location) -> Bool {
        if let index = locations.firstIndex(where: { $0.name == hall.name }) {
            return locations[index].isFound
        }
        return false
    }

    func collect(_ hall: Location) {
        if let index = locations.firstIndex(where: { $0.name == hall.name }) {
            locations[index].isFound = true
        }
    }


}
