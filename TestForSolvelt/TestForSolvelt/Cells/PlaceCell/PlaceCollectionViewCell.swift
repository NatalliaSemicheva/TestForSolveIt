//
//  PlaceCollectionViewCell.swift
//  TestForSolvelt
//
//  Created by Наталия Семичева on 7/30/19.
//  Copyright © 2019 Наталия Семичева. All rights reserved.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var freeDeliveryLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var numberOfVotingLabel: UILabel!
    
    private let freeDelivery = "Free delivery"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }
    
    func config() {
        freeDeliveryLabel.text = freeDelivery
    }

    func setupCell(with place: Place) {
        imageView.image = place.image
        nameLabel.text = place.name
        descriptionLabel.text = place.description
        freeDeliveryLabel.alpha = place.isFreeDelivery ? 1 : 0
        rateLabel.text = String(place.rating)
        numberOfVotingLabel.text = "(\(place.namuberOfVoting) raitings)"
    }
}
