//
//  QuantamITSolutionApp.swift
//  QuantamITSolution
//
//  Created by Chetan Choudhary on 14/05/24.
//

import SwiftUI

@main
struct QuantamITSolutionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
