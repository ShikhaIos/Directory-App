//
//  RoomViewModel.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation

class RoomViewModel: NSObject {
    private var roomService: RoomServiceProtocol
    
    var reloadTableView: (() -> Void)?
    
    var rooms = Rooms()
    
    var roomsCellViewModel = [RoomCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }

    init(roomService: RoomServiceProtocol = RoomService()) {
        self.roomService = roomService
    }
    
    func getRoomsList() {
        roomService.getRoomList{ success, model, error in
            if success, let rooms = model {
                self.fetchData(roomlist: rooms)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchData(roomlist: Rooms) {
        self.rooms = roomlist // Cache
        var obj = [RoomCellViewModel]()
        let filteredRooms = roomlist.filter{$0.isOccupied==true}
        for room in filteredRooms {
           obj.append(createCellModel(room: room))
        }
        roomsCellViewModel = obj
    }
    
    func createCellModel(room: Room) -> RoomCellViewModel {
        let id = room.id ?? ""
        let isOccupied = room.isOccupied ?? false
        let maxOccupancy = room.maxOccupancy ?? 0
    
        return RoomCellViewModel(id: id, maxOccupancy: maxOccupancy, isOccupied: isOccupied)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> RoomCellViewModel {
        return roomsCellViewModel[indexPath.row]
    }
}
