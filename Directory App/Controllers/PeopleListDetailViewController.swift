//
//  PeopleListDetailViewController.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import UIKit

class PeopleListDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentContainer: UIStackView!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var favouriteColor: UILabel!

    var viewModel: PeopleCellViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
         updateUIForDataProvider()
        // Do any additional setup after loading the view.
        styleUI()
        createNavigationBarUI()
    }
    
    func updateUIForDataProvider(){
        if let dataProvider = viewModel {
            imageView.downloaded(from: dataProvider.avatar)
            nameLabel.text = "\(dataProvider.firstname) \(dataProvider.lastname)"
            jobTitle.text = "\("JobTitle:") \(dataProvider.jobtitle)"
            emailLabel.text = "\("Email:") \(dataProvider.email)"
            favouriteColor.text = "\("FavouriteColor:") \(dataProvider.favouriteColor)"

        }
    }
    
    func createNavigationBarUI(){
        self.title = "Detail Screen"
        self.navigationItem.backBarButtonItem = NavigationStyling.backBarButtonWithoutText()
    }
    
    func styleUI() {
        AppStyling.applyStyling(.detail(view: self))
    }

}
