//
//  Bundle+Extensions.swift
//  JsonParsingLab
//
//  Created by Matthew Ramos on 12/4/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import Foundation

extension Bundle {
    static func readJSONData (filename: String, ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("Error: Can't read data")
        }
        var data: Data!
        
        do {
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("Error: Can't read data")
        }
        return data
    }
}
