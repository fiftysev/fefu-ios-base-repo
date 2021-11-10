//
//  ActivityTypeCollectionViewCell.swift
//  fefuactivity
//
//  Created by Егор Блинов on 10.11.2021.
//

import UIKit

struct ActivityTypeCellViewModel {
    let activityType: String
    let activityTypeImage: UIImage
    let titleForManageState: String
}

class ActivityTypeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var activityTypeLabel: UILabel!
    @IBOutlet weak var activityImage: UIImageView!
    
    var titleForManageState: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        cardView.layer.cornerRadius = 14
    }
    
    func bind(_ model: ActivityTypeCellViewModel) {
        activityTypeLabel.text = model.activityType
        activityImage.image = model.activityTypeImage
        titleForManageState = model.titleForManageState
    }
}
