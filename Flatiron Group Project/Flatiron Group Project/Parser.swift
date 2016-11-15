//
//  Parser.swift
//  Flatiron Group Project
//
//  Created by Alexander Mason on 11/15/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import Foundation


<<<<<<< HEAD
func readDataFromFile() -> String? {
    guard let filePath = Bundle.main.path(forResource: "market", ofType: "csv") else { return nil }
    print()
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8)
        return contents
    } catch {
        print("File failed for \(filePath) with \(error)")
        return nil
    }
    
}


func csvParser(csv: String) -> [[String: String]] {
    print("parser called")
    var jsonDictionary = [[String: String]]()
    var dictionary = [String: String]()
    let line: [String] = csv.components(separatedBy: NSCharacterSet.newlines) as [String]
    var values = [String]()
    var arrayOfValues = [[String]]()
    
    for market in line {
        print("line is \(market)")
        if market != "" {
            values = market.components(separatedBy: ",")
            print(values)
            arrayOfValues.append(values)
        }
    }
    
    for values in arrayOfValues {
        dictionary["name"] = values[0]
        dictionary["latitude"] = values[1]
        dictionary["longitude"] = values[2]
        dictionary["yearRound"] = values[3]
        dictionary["timeOfDay"] = values[4]
        dictionary["days"] = values[5]
        dictionary["EBT"] = values[6]
        dictionary["borough"] = values[7]
        dictionary["website"] = values[8]
        dictionary["extras"] = values[9]
        jsonDictionary.append(dictionary)
    }
    
    print(jsonDictionary.count)
    
    print(jsonDictionary)
    
    return jsonDictionary
=======
class Parser {
    
    
    func readDataFromFile() -> String? {
        guard let filePath = Bundle.main.path(forResource: "market", ofType: "csv") else { return nil }
        print()
        do {
            let contents = try String(contentsOfFile: filePath, encoding: .utf8)
            return contents
        } catch {
            print("File failed for \(filePath) with \(error)")
            return nil
        }
        
    }

    
    func csvParser(csv: String) -> [[String: String]] {
        print("parser called")
        var jsonDictionary = [[String: String]]()
        var dictionary = [String: String]()
        let line: [String] = csv.components(separatedBy: NSCharacterSet.newlines) as [String]
        var values = [String]()
        var arrayOfValues = [[String]]()
        
        for market in line {
            print("line is \(market)")
            if market != "" {
                values = market.components(separatedBy: ",")
                print(values)
                arrayOfValues.append(values)
            }
        }
        
        for values in arrayOfValues {
            dictionary["name"] = values[0]
            dictionary["latitude"] = values[1]
            dictionary["longitude"] = values[2]
            dictionary["yearRound"] = values[3]
            dictionary["timeOfDay"] = values[4]
            dictionary["days"] = values[5]
            dictionary["EBT"] = values[6]
            dictionary["borough"] = values[7]
            dictionary["website"] = values[8]
            dictionary["extras"] = values[9]
            jsonDictionary.append(dictionary)
        }
        
        print(jsonDictionary.count)
        
        print(jsonDictionary)
        
        return jsonDictionary
    }
    
    
    
>>>>>>> 736792551c06ee2be53226c68169cfcede5d84bc
}
