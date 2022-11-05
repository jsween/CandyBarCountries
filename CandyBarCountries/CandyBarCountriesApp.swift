//
//  CandyBarCountriesApp.swift
//  CandyBarCountries
//
//  Created by Jonathan Sweeney on 11/5/22.
//

import SwiftUI

@main
struct CandyBarCountriesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
