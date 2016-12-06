//
//  MarketDatabase.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/17/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

//MARK: - Authorization functions
class FirebaseAPI {
    static func signUp(email: String, password: String, name: String, completion: @escaping (Bool) -> () ) {
        let ref = FIRDatabase.database().reference().root
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                ref.child("users").child((user?.uid)!).child("email").setValue(email)
                ref.child("users").child((user?.uid)!).child("name").setValue(name)
                completion(true)
            } else {
                print(error!)
                completion(false)
            }
        })
    }
    
    static func signIn(email: String, password: String, completion: @escaping (Bool) -> () ) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        })
    }
    
    static func userIsLoggedIn() -> Bool {
        
        return FIRAuth.auth()?.currentUser != nil ? true : false
        
    }
    
    static func getCurrentUserID() -> String? {
        
        return FIRAuth.auth()?.currentUser?.uid
        
    }
    
}




//MARK: - Market structure functions
extension FirebaseAPI {
    
    static func pullMarketsFromFirebase(completion: @escaping ([String : [String : String]]) -> () ) {
        let ref = FIRDatabase.database().reference().child("markets")
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as! [String : [String : String]]
            completion(value)
        })
    }
    
    static func replaceMarketInfo(withName marketName: String, replaceWith data: [String : String], completion: () -> () ) {
        
        let ref = FIRDatabase.database().reference().child("markets")
        
        if let newMarketName = data["name"] {
            
            self.readMarket(withName: marketName, completion: { (currentData) in
                
                ref.child(newMarketName).setValue(currentData)
                
                for (key, value) in data {
                    
                    if key != "votes" && key != "name" {
                        print("newMarket")
                        ref.child(marketName).child(key).setValue(value)
                        
                    }
                    
                }
                
            })
            
        } else {
            
            for (key, value) in data {
             
                if key != "votes" {
                    print("replacing")
                    ref.child(marketName).child(key).setValue(value)
                    
                }
                
            }
        }
    }
    
    static func readMarket(withName market: String, completion: @escaping ([String:String]) -> () ) {
        let ref = FIRDatabase.database().reference().child("markets").child(market)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let json = snapshot.value as? [String : String] {
                dump(json)
                completion(json)
            }
        })
    }
}

//MARK: - Comment structure functions
extension FirebaseAPI {
    
    static func writeCommentFor(market: String, with message: String, from name: String) {
        let uid = FIRAuth.auth()?.currentUser?.uid
        let ref = FIRDatabase.database().reference().child("comments")
        let marketRef = ref.child("\(market)").childByAutoId()
        marketRef.child("timeStamp").setValue(Date().timeIntervalSince1970)
        marketRef.child("comment").setValue(message)
        marketRef.child("likes").setValue(0)
        marketRef.child("id").setValue(uid)
        marketRef.child("name").setValue(name)
    }
    
    static func readCommentFor(market: String, completion: @escaping ([String : [String : Any]]) -> () ) {
        
        let ref = FIRDatabase.database().reference().child("comments").child("\(market)")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.exists() else {
                print("Comments don't exist")
                return
            }
            let value = snapshot.value as! [String : [String : Any]]
            completion(value)
        })
    }
    
    static func writeToLikes(with ref: FIRDatabaseReference, newLikes: Int) {
        ref.setValue(newLikes)
    }
    
    static func increaseLikesWith(commentID: String, in market: String) {
        let ref = FIRDatabase.database().reference().child("comments").child("\(market)").child("\(commentID)").child("likes")
        ref.observeSingleEvent(of: .value, with: {snapshot in
            
            let likes = snapshot.value as! Int
            writeToLikes(with: ref, newLikes: likes + 1)
            
        })
    }
    
    static func writeReportFor(commentID: String) {
        let ref = FIRDatabase.database().reference().child("reports").child(commentID)
        
//        ref.runTransactionBlock({ (currentData) -> FIRTransactionResult in
//            if var post = currentData.value as? [String : AnyObject], let uid = FIRAuth.auth()?.currentUser?.uid {
//                var stars: Dictionary<String, Bool>
//                stars = post["stars"] as? [String : Bool] ?? [:]
//                var starCount = post["starCount"] as? Int ?? 0
//                if let _ = stars[uid] {
//                    // Unstar the post and remove self from stars
//                    starCount -= 1
//                    stars.removeValue(forKey: uid)
//                } else {
//                    // Star the post and add self to stars
//                    starCount += 1
//                    stars[uid] = true
//                }
//                post["starCount"] = starCount as AnyObject?
//                post["stars"] = stars as AnyObject?
//                
//                // Set value and report transaction success
//                currentData.value = post
//                
//                return FIRTransactionResult.success(withValue: currentData)
//            }
//        }, andCompletionBlock: { (error, committed, snapshot) in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//        })
        
    }
    
}

//MARK: - UpdateMarkets structure functions
extension FirebaseAPI {
    
    static func writeToUpdate(withName marketName: String, changes: [String : String]) {
        
        if changes.isEmpty { return }
        
        let ref = FIRDatabase.database().reference().child("updateMarkets")
        
        ref.child("\(marketName)").childByAutoId().setValue(changes)
        
    }
    
    static func readFromUpdate(with marketName: String, completion: @escaping ((Bool, [String : Any])) -> () ) {
        
        let ref = FIRDatabase.database().reference().child("updateMarkets").child("\(marketName)")
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if snapshot.exists() {
                let results = snapshot.value as! [String : Any]
                completion((true, results))
            } else {
                completion((false,[:]))
            }
        })
    }
    
    static func upvoteInMarket(forName marketName: String, withId marketID: String, upvoted: Bool) {
        //make sure people cant upvote same thing over and over and over 
        let ref = FIRDatabase.database().reference().child("updateMarkets").child("\(marketName)").child("\(marketID)")
        
        ref.runTransactionBlock({ (currentData) -> FIRTransactionResult in
            
            if let json = currentData.value as? [String : String] {
                
                if let value = json["votes"] {
                    
                    if let votes = Int(value) {
                        
                        var returnValue = json
                        
                        returnValue["votes"] = upvoted ? "\(votes + 1)" : "\(votes - 1)"
                        
                        currentData.value = returnValue
                        
                    }
                }
            }
            
            return FIRTransactionResult.success(withValue: currentData)
            
        }, andCompletionBlock: { (error, committed, snapshot) in
            
            if let error = error {
                
                print(error)
                
            } else {
                
                //if votes is over a certain amount, use function to replace appropriate fields and remove appropriate database objects
                if let json = snapshot?.value as? [String : String] {
                    
                    if let votes = json["votes"] {
                        
                        if let num = Int(votes) {
                            
                            if num >= 5 {
                                
                                self.replaceMarketInfo(withName: marketName, replaceWith: json, completion: {
                                    
                                    ref.removeValue()
                                    
                                })
                                
                            } else if num <= -5 {
                                
                                ref.removeValue()
                                
                            }
                        }
                    }
                }
            }
        })
    }
    
}



//MARK: - Load Firebase with information from CSV file
extension FirebaseAPI {
    static func makeMarkets() {
        let ref = FIRDatabase.database().reference()
        
        let marketsRef = ref.child("markets")
        
        let returnDictionary = Parser.csvParser()
        
        var count = 0
        for dictionary in returnDictionary {
            count += 1
            
            let nameChild = marketsRef.child(dictionary["name"]!)
            
            let addressRef = nameChild.child("address")
            addressRef.setValue(dictionary["address"])
            
            let latitudeRef = nameChild.child("latitude")
            latitudeRef.setValue(dictionary["latitude"])
            
            let longitudeRef = nameChild.child("longitude")
            longitudeRef.setValue(dictionary["longitude"])
            
            let timeOfYearValue = dictionary["timeOfYear"]
            let timeOfYearTuple = Parser.timeOfYear(monthString: timeOfYearValue!)
            
            let openDate = nameChild.child("openDate")
            openDate.setValue(timeOfYearTuple.0)
            
            let closeDate = nameChild.child("closeDate")
            closeDate.setValue(timeOfYearTuple.1)
            
            let timeOfDayValue = dictionary["timeOfDay"]
            let dayTuple = Parser.timeOfDay(dayString: timeOfDayValue!)
            
            let startTime = nameChild.child("startTime")
            startTime.setValue(dayTuple.0)
            
            let endTime = nameChild.child("endTime")
            endTime.setValue(dayTuple.1)
            
            let datesRef = nameChild.child("days")
            datesRef.setValue(dictionary["days"])
            
            let ebtRef = nameChild.child("ebt")
            ebtRef.setValue(dictionary["EBT"])
            
            let boroughRef = nameChild.child("borough")
            boroughRef.setValue(dictionary["borough"])
            
            let websiteRef = nameChild.child("website")
            websiteRef.setValue(dictionary["website"])
            
            let extrasRef = nameChild.child("extras")
            extrasRef.setValue(dictionary["extras"])
            
        }
    }
}

//MARK: Add market to firebase database

extension FirebaseAPI {
    static func addMarketToFirebase(name: String, address: String, lat: String, long: String, openDate: String, closeDate: String, openTime: String, closeTime: String, acceptEBT: String, days: String, website: String) {
        
        let ref = FIRDatabase.database().reference().child("addMarket")
        
        let nameChild = ref.child(name)
        
        let returnDict = ["address": address, "latitude": lat, "longitude": long, "openDate": openDate, "closeDate": closeDate, "startTime": openTime, "endTime": closeTime, "ebt": acceptEBT, "days": days, "website": website, "votes": "1"]
        
        nameChild.setValue(returnDict)
        
    }
    
    static func pullAddedMarketFromFirebase(completion:@escaping ([AddMarket])-> Void) {
        print("In pull added market from firebase")
        var addedMarketArray = [AddMarket]()
        let ref = FIRDatabase.database().reference().child("addMarket")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            let names = snapshot.value as! [String: [String: String]]
            var nameArray = [String]()
            
            for (key, value) in names {
                nameArray.append(key as! String)
                
                let marketName = key
                print("Market name is \(marketName)")
                guard let startTime = value["startTime"] else { return }
                guard let endTime = value["endTime"] else { return }
                guard let openDate = value["openDate"] else { return }
                guard let closeDate = value["closeDate"] else { return }
                guard let address = value["address"] else { return }
                guard let latitude = value["latitude"] else { return }
                guard let longitude = value["longitude"] else { return }
                guard let ebt = value["ebt"] else { return }
                guard let website = value["website"] else { return }
                guard let days = value["days"] else { return }
                guard let votes = value["votes"] else { return }
                
                let addedMarket = AddMarket(marketName: marketName, startTime: startTime, endTime: endTime, openDate: openDate, closeDate: closeDate, address: address, latitude: latitude, longitude: longitude, ebt: ebt, website: website, days: days, votes: votes)
                
                
                addedMarketArray.append(addedMarket)
            }
            
            completion(addedMarketArray)
            
        })

    }
    
    
    static func upvoteAddedMarket(forName marketName: String, withId marketID: String, upvoted: Bool) {
        //make sure people cant upvote same thing over and over and over
        let ref = FIRDatabase.database().reference().child("addMarket").child("\(marketName)")
        
        ref.runTransactionBlock({ (currentData) -> FIRTransactionResult in
            
            if let json = currentData.value as? [String : String] {
                
                if let value = json["votes"] {
                    
                    if let votes = Int(value) {
                        
                        var returnValue = json
                        
                        returnValue["votes"] = upvoted ? "\(votes + 1)" : "\(votes - 1)"
                        
                        currentData.value = returnValue
                        
                    }
                }
            }
            
            return FIRTransactionResult.success(withValue: currentData)
            
        }, andCompletionBlock: { (error, committed, snapshot) in
            
            if let error = error {
                
                print(error)
                
            } else {
                
                //if votes is over a certain amount, use function to replace appropriate fields and remove appropriate database objects
                if let json = snapshot?.value as? [String : String] {
                    
                    if let votes = json["votes"] {
                        
                        if let num = Int(votes) {
                            
                            if num >= 5 {
                                
                                self.replaceMarketInfo(withName: marketName, replaceWith: json, completion: {
                                    
                                    ref.removeValue()
                                    
                                })
                                
                            } else if num <= -5 {
                                
                                ref.removeValue()
                                
                            }
                        }
                    }
                }
            }
        })
    }
    
}












