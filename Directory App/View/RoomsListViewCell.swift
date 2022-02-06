//
//  RoomsListViewCell.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import UIKit

class RoomsListViewCell: UITableViewCell {

    @IBOutlet weak var maxOccupancy: UILabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initalise()
        styleUI()
    }

    var dataProvider: RoomCellViewModel? {
        didSet {
            maxOccupancy.text = "\(dataProvider?.maxOccupancy ?? 0)"
        }
    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initalise() {
        // Cell view customization
        backgroundColor = .clear

        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    func styleUI() {
        AppStyle.styleForView(view: self, data: dataProvider)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        maxOccupancy.text = nil
    }
    
}
