//
//  DiningHallLocations.swift
//  dining_hall_collector
//
//  Created by Bruno Ndiba Mbwaye Roy on 3/28/25.
//
import SwiftUI

extension Location {
    static var locs: [Location] = [
        Location(name: "1920 Commons", description: "A popular dining hall in the heart of campus.", image: Image("commons"), coords: .commons),
        Location(name: "Accenture Cafe", description: "Modern cafe with a variety of dining options.", image: Image("accenture"), coords: .accenture),
        Location(name: "Falk Hillel", description: "Kosher dining option on campus.", image: Image("falk"), coords: .falk),
        Location(name: "Hill Dining", description: "Convenient dining location for students.", image: Image("hill"), coords: .hill),
        Location(name: "Houston Market", description: "Diverse food choices in a central location.", image: Image("houston"), coords: .houston),
        Location(name: "Joe's Cafe", description: "Cozy cafe with great coffee and snacks.", image: Image("joes"), coords: .joes),
        Location(name: "King's Court English Dining", description: "Traditional dining hall with multiple stations.", image: Image("kchec"), coords: .kceh),
        Location(name: "Lauder Dining", description: "Modern dining facility with international cuisine.", image: Image("lauder"), coords: .lauder),
        Location(name: "Mcclelland Sushi Spot", description: "Specializing in fresh sushi and Asian cuisine.", image: Image("mcclelland"), coords: .mcclelland),
        Location(name: "Pret A Manger", description: "Quick and fresh grab-and-go options.", image: Image("pret"), coords: .pret),
        Location(name: "Quaker Kitchen", description: "Healthy and sustainable dining choices.", image: Image("quaker"), coords: .quaker)
    ]
}
