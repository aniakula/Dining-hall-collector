import Foundation
import SwiftUI


class NavViewModel {
    private var locs: [Location] = [
        Location(name: "1920 Commons", description: "", image: Image("commons"), coords: .commons),
        Location(name: "Accenture Cafe", description: "", image: Image("accenture"), coords: .accenture),
        Location(name: "Falk Hillel", description: "", image: Image("falk"), coords: .falk),
        Location(name: "Hill Dining", description: "", image: Image("hill"), coords: .hill),
        Location(name: "Houston Market", description: "", image: Image("houston"), coords: .houston),
        Location(name: "Joe's Cafe", description: "", image: Image("joes"), coords: .joes),
        Location(name: "King's Court English Dining", description: "", image: Image("kchec"), coords: .kceh),
        Location(name: "Lauder Dining", description: "", image: Image("lauder"), coords: .lauder),
        Location(name: "Mcclelland Sushi Spot", description: "", image: Image("mcclelland"), coords: .mcclelland),
        Location(name: "Pret A Manger", description: "", image: Image("pret"), coords: .pret),
        Location(name: "Quaker Kitchen", description: "", image: Image("quaker"), coords: .quaker)
    ]
    
    private var selectedLoc: Int?

}
