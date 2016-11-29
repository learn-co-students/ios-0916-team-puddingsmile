//
//  Firebase.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/18/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CoreData


class DataStore {
    
    var markets = [Market]()
    
    static let sharedInstance = DataStore()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Market")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        
    }
    
    func fetchData() {
        let context = persistentContainer.viewContext
        
        let marketRequest = NSFetchRequest<Market>(entityName: "Market")
        do {
            markets = try context.fetch(marketRequest)
        } catch {
            print("\(error)")
        }
        
        if markets.count == 0 {
            loadDataFromFirebase()
        }
        
    }

    func loadDataFromFirebase() {
        let context = persistentContainer.viewContext
        FirebaseAPI.pullMarketsFromFirebase { (markets) in
            for (key, value) in markets {
                
                let market: Market = NSEntityDescription.insertNewObject(forEntityName: "Market", into: context) as! Market
                market.name = key
                market.address = value["address"]
                market.borough = value["borough"]
                market.closeDate = value["closeDate"]
                market.weekDayOpen = value["days"]
                market.acceptEBT = value["ebt"]
                market.endTime = value["endTime"]
                market.extras = value["extras"]
                market.latitude = value["latitude"]
                market.longitude = value["longitude"]
                market.openDate = value["openDate"]
                market.startTime = value["startTime"]
                market.marketWebsite = value["website"]
                
                self.markets.append(market)
                
            }
            self.saveContext()
            self.fetchData()
        }
    }
    
    /*
    func loadCommentsFromFirebase() {
        let context = persistentContainer.viewContext
        FirebaseAPI.readCommentFor(market: <#T##String#>) { (comments) in
            for (key, value) in comments {
                var marketComment: MarketComment = NSEntityDescription.insertNewObject(forEntityName: "Comment", into: context) as! MarketComment
                marketComment.comment = value["comment"]
                marketComment.likes = value["likes"]
                marketComment.commentID =
                marketComment.name
                marketComment.timeStamp
                
            }
        }
    }

    */
}





