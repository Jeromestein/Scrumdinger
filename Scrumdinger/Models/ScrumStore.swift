//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Jiayi on 1/26/23.
//

import Foundation
import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        /**
         Use the shared instance of the FileManager class to get the location of the Documents directory for the current user
         */
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrums.data")
    }
}
