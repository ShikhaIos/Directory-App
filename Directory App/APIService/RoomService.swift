//
//  RoomService.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation

protocol RoomServiceProtocol {
    func getRoomList(completion: @escaping (_ success: Bool, _ results: Rooms?, _ error: String?) -> ())
}

class RoomService: RoomServiceProtocol {
    func getRoomList(completion: @escaping (Bool, Rooms?, String?) -> ()) {
        HttpRequestHelper().GET(url: "\(basedefaultUrl)\("rooms")", params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Rooms.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse rooms to model")
                }
            } else {
                completion(false, nil, "Error: roomlist GET Request failed")
            }
        }
    }
}
