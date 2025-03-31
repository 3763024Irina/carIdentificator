//
//  carIdentificatorApp.swift
//  carIdentificator
//
//  Created by Irina on 31/3/25.
//

import SwiftUI


struct carIdentificatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
