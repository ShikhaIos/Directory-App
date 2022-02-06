//
//  Rooms.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation

//"createdAt": "2022-01-24T20:52:50.765Z",
//    "isOccupied": false,
//    "maxOccupancy": 53539,
//    "id": "1"


typealias Rooms = [Room]

struct Room : Decodable {
    
    var id:String?
    var isOccupied:Bool?
    var maxOccupancy:Int?
    var createdAt:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isOccupied = "isOccupied"
        case maxOccupancy = "maxOccupancy"
        case createdAt = "createdAt"
        
    }
}
