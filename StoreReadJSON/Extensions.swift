//
//  Extensions.swift
//  StoreReadJSON
//
//  Created by Daniel Hjärtström on 2019-08-20.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

extension Data {
    func decode<T: Codable>() -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: self)
        } catch let error {
            print(error)
        }
        return nil
    }
}

extension Encodable {
    func encode() -> (string: String?, data: Data?)? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(self)
            let string = String(data: data, encoding: .utf8)
            return (string: string, data: data)
        } catch let error {
            print(error)
        }
        return nil
    }
}

extension Data {
    
    static var defaultManager: FileManager {
        return FileManager.default
    }
    
    static var documentDirectory: URL? {
        return defaultManager.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    static func fetch(_ filename: String, type: FileType) -> Data? {
        guard let directory = documentDirectory else { return nil }
        let jsonURL = directory.appendingPathComponent("\(filename).\(type.rawValue)")
        
        do {
            return try Data(contentsOf: jsonURL)
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    func storeAs(_ filename: String, type: FileType) {
        guard let directory = Data.documentDirectory else { return }
        let jsonURL = directory.appendingPathComponent("\(filename).\(type.rawValue)")

        if Data.defaultManager.fileExists(atPath: jsonURL.path) {
            do {
                try Data.defaultManager.removeItem(at: jsonURL)
            } catch let error {
                print(error)
            }
        }
        
        Data.defaultManager.createFile(atPath: jsonURL.path, contents: self, attributes: nil)
        
        do {
            let contents = try Data.defaultManager.contentsOfDirectory(atPath: directory.path)
            print(contents)
        } catch let error {
            print(error)
        }
    }
}
