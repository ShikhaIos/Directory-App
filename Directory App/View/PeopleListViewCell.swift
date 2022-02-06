//
//  PeopleListViewCell.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import UIKit

class PeopleListViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
   
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    var cellViewdataProviderModel: PeopleCellViewModel? {
        didSet {
            nameLabel.text = "\(cellViewdataProviderModel?.firstname ?? "") \(cellViewdataProviderModel?.lastname ?? "")"
            jobTitle.text = cellViewdataProviderModel?.jobtitle
            avatar.downloaded(from: cellViewdataProviderModel?.avatar ?? "")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initalise()
        StyleUI()
    }

    func initalise() {
        // Cell view customization
        backgroundColor = .clear

        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    func StyleUI() {
        AppStyle.styleForView(view: self, data: cellViewdataProviderModel)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        jobTitle.text = nil
        avatar.image = nil
    }
}


