//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Jiayi on 1/23/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
