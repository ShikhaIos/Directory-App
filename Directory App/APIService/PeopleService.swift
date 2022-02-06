//
//  PeopleService.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation

let basedefaultUrl = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"

protocol PeopleServiceProtocol {
    func getPeopleList(completion: @escaping (_ success: Bool, _ results: PeopleList?, _ error: String?) -> ())
}

class PeopleService: PeopleServiceProtocol {
    
    func getPeopleList(completion: @escaping (Bool, PeopleList?, String?) -> ()) {
        HttpRequestHelper().GET(url: "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/people", params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(PeopleList.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse PeopleList to model")
                }
            } else {
                completion(false, nil, "Error: PeopleList GET Request failed")
            }
        }
    }
}
