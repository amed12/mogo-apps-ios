//
//  mogo_appsApp.swift
//  mogo apps
//
//  Created by Achmad Fathullah on 26/03/21.
//

import SwiftUI

@main
struct mogo_appsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
