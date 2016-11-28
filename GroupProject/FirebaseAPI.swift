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
}

//MARK: - Comment structure functions
extension FirebaseAPI {
    
    static func writeCommentFor(market: String, with message: String, from name: String) {
        
        let ref = FIRDatabase.database().reference().child("comments")
        let marketRef = ref.child("\(market)").childByAutoId()
        marketRef.child("timeStamp").setValue(Date().timeIntervalSince1970)
        marketRef.child("comment").setValue(message)
        marketRef.child("likes").setValue(0)
        marketRef.child("name").setValue(name)
    }
    
    static func writeToLikes(with ref: FIRDatabaseReference, newLikes: Int) {
        ref.setValue(newLikes)
    }
    
    static func readCommentFor(market: String, completion: @escaping ([String : [String : Any]]) -> () ) {
        
        let ref = FIRDatabase.database().reference().child("comments").child("\(market)")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as! [String : [String : Any]]
            completion(value)
        })
    }
    
    static func increaseLikesFor(comment: MarketComment, in market: String) {
        let ref = FIRDatabase.database().reference().child("comments").child("\(market)").child("\(comment.commentID)").child("likes")
        ref.observeSingleEvent(of: .value, with: {snapshot in
            
            let likes = snapshot.value as! Int
            writeToLikes(with: ref, newLikes: likes + 1)
            
        })
    }
    
}

//MARK: - Suggestion structure functions
extension FirebaseAPI {
    
    static func getCount() -> String {
        var childrenCount = 0
        let testRef = FIRDatabase.database().reference()
        testRef.observe(.value, with: { (snapshot) in
            let test = snapshot.childrenCount
               print("CHILDREN COUNT IS \(childrenCount)")
        })
        return "CHILDREN COUNT IS \(childrenCount)"
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


    
