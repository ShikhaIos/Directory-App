//
//  People.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation

//"createdAt": "2022-01-24T17:02:23.729Z",
//    "firstName": "Maggie",
//    "avatar": "https://randomuser.me/api/portraits/women/21.jpg",
//    "lastName": "Brekke",
//    "email": "Crystel.Nicolas61@hotmail.com",
//    "jobtitle": "Future Functionality Strategist",
//    "favouriteColor": "pink",
//    "id": "1"

typealias PeopleList = [People]

struct People : Decodable {
    
    var id:String?
    var firstName:String?
    var avatar:String?
    var lastName:String?
    var email:String?
    var jobtitle:String?
    var favouriteColor:String?
    var createdAt:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "firstName"
        case avatar = "avatar"
        case lastName = "lastName"
        case email = "email"
        case jobtitle = "jobtitle"
        case favouriteColor = "favouriteColor"
        case createdAt = "createdAt"

       }
}
