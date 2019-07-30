//
//  CategoryCollectionViewCell.swift
//  TestForSolvelt
//
//  Created by Наталия Семичева on 7/30/19.
//  Copyright © 2019 Наталия Семичева. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewWithShadow: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberOfPlacesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    func config() {
        viewWithShadow.addShadow()
    }
    
    func setupCell(with category: Category) {
        nameLabel.text = category.name
        numberOfPlacesLabel.text = "\(category.numberOfPlaces) places"
        imageView.image = category.image
    }
}
