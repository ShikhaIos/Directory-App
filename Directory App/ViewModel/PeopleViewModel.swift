//
//  PeopleViewModel.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation

class PeopleViewModel: NSObject {
    private var peopleService: PeopleServiceProtocol
    
    var reloadTableView: (() -> Void)?
    
    var peopleList = PeopleList()
    
    var peopleCellViewModels = [PeopleCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }

    init(peopleService: PeopleServiceProtocol = PeopleService()) {
        self.peopleService = peopleService
    }
    ///Method to get the
    ///list of data for people
    ///by calling the api
    func getPeopleList() {
        peopleService.getPeopleList{ success, model, error in
            if success, let peopleList = model {
                self.fetchData(peopleList: peopleList)
            } else {
                print(error!)
            }
        }
    }
    
    private func fetchData(peopleList: PeopleList) {
        self.peopleList = peopleList // Cache
        var obj = [PeopleCellViewModel]()
        for people in peopleList {
            obj.append(createCellModel(people: people))
        }
        peopleCellViewModels = obj
    }
    
    func createCellModel(people: People) -> PeopleCellViewModel {
        let id = people.id ?? ""
        let name = people.firstName ?? ""
        let lastname = people.lastName ?? ""
        let jobtitle = people.jobtitle ?? ""
        let avatar = people.avatar ?? ""
        let email = people.email ?? ""
        let favouriteColor = people.favouriteColor ?? ""
        return PeopleCellViewModel(id: id, firstname: name , lastname : lastname , jobtitle : jobtitle, email : email, avatar: avatar, favouriteColor: favouriteColor)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PeopleCellViewModel {
        return peopleCellViewModels[indexPath.row]
    }
}
