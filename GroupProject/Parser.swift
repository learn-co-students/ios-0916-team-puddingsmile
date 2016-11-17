//
//  Parser.swift
//  Flatiron Group Project
//
//  Created by Alexander Mason on 11/15/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import Foundation

struct Parser {
    private static func readDataFromFile() -> String? {
        guard let filePath = Bundle.main.path(forResource: "MarketInfo", ofType: "csv") else { return nil }
        
        do {
            let contents = try String(contentsOfFile: filePath, encoding: .utf8)
            return contents
        } catch {
            print("File failed for \(filePath) with \(error)")
            return nil
        }
    }
    
    
    static func csvParser() -> [[String : String]] {
        let csv = readDataFromFile()
        
        guard let uCSV = csv else { return [["Error": ""]] }
        
        var jsonDictionary = [[String: String]]()
        var dictionary = [String: String]()
        let line: [String] = uCSV.components(separatedBy: NSCharacterSet.newlines) as [String]
        var values = [String]()
        var arrayOfValues = [[String]]()
        
        for market in line {
            
            if market != "" {
                values = market.components(separatedBy: ",")
                
                arrayOfValues.append(values)
            }
        }
        for values in arrayOfValues {
            dictionary["name"] = values[0]
            dictionary["address"] = values[1]
            dictionary["latitude"] = values[2]
            dictionary["longitude"] = values[3]
            dictionary["timeOfYear"] = values[4]
            dictionary["timeOfDay"] = values[5]
            dictionary["days"] = values[6]
            dictionary["EBT"] = values[7]
            dictionary["borough"] = values[8]
            dictionary["website"] = values[9]
            dictionary["extras"] = values[10]
            jsonDictionary.append(dictionary)
        }
        return jsonDictionary
    }
}





