//
//  ViewController.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var viewRoomListButton: UIButton!
    @IBOutlet weak var viewPeopleListButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        styleUI()
        viewRoomListButton.accessibilityIdentifier = "viewRoomListButton"
        viewPeopleListButton.accessibilityIdentifier = "viewPeopleListButton"
    }
    /// For styling UI
    /// Call method of appstyle
    func styleUI(){
        AppStyling.applyStyling(.home(view: self))
    }
        
     ///Button Action methods
    ///For People lists
    ///and Occupied Room List

    @IBAction func btn_view_people_list_action(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PeopleListViewController") as? PeopleListViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btn_view_room_list_action(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RoomsListViewController") as? RoomsListViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

