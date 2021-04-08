//
//  CreateGoalHeaderCell.swift
//  mogo-apps-ios
//
//  Created by Carlos Gamaliel Manurung on 07/04/21.
//

import UIKit

protocol CreateGoalHeaderCellDelegate: class {
    func openCollectionGallery(status: Bool)
}

class CreateGoalHeaderCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var labelIcon: UILabel!
    @IBOutlet weak var buttonIcon: UIButton!
    
    weak var delegate: CreateGoalHeaderCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonIcon.addTarget(self, action: #selector(toIconCollection), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func toIconCollection() {
        self.delegate?.openCollectionGallery(status: true)
    }
    
}
