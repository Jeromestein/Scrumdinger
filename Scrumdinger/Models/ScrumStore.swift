//
//  ScrumStore.swift
//  Scrumdinger
//  https://developer.apple.com/tutorials/app-dev-training/persisting-data#Add-a-method-to-load-data
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
    
    /**
     Result is a single type that represents the outcome of an operation, whether it’s a success or failure. The load function accepts a completion closure that it calls asynchronously with either an array of scrums or an error.
     */
    static func load(completion: @escaping (Result<[DailyScrum], Error>)->Void) {
        /**
         Dispatch queues are first in, first out (FIFO) queues to which your application can submit tasks. Background tasks have the lowest priority of all tasks.
         */
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                // Create a file handle for reading scrums.data.
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyScrums))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(scrums: [DailyScrum], completion: @escaping (Result<Int, Error>)->Void) {
            DispatchQueue.global(qos: .background).async {
                do {
                    let data = try JSONEncoder().encode(scrums)
                    let outfile = try fileURL()
                    try data.write(to: outfile)
                    DispatchQueue.main.async {
                        completion(.success(scrums.count))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
}
