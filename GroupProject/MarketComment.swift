//
//  MarketComment.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation


struct MarketComment {
    let comment: String
    var likes: Int
    let timeStamp: Double
    let name: String
    let commentID: String
    
    init(id: String, value: [String:Any]) {
        comment = value["comment"] as! String
        likes = value["likes"] as! Int
        timeStamp = value["timeStamp"] as! Double
        name = value["name"] as! String
        commentID = id
    }
}
