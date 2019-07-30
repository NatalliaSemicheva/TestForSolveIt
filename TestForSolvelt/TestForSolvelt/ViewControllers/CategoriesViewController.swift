//
//  CategoriesViewController.swift
//  TestForSolvelt
//
//  Created by Наталия Семичева on 7/30/19.
//  Copyright © 2019 Наталия Семичева. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var topCategoriesLabel: UILabel!
    @IBOutlet weak var leftArrowImageView: UIImageView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    private var categories = [Category]()
    private let idCell = "CategoryCollectionViewCell"
    private let topCategoriesText = "Top categories"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
    
    func setCategories(_ categories: [Category]) {
        self.categories = categories
        categoriesCollectionView.reloadData()
    }
    
    @IBAction func actionFinishTouch(_ sender: Any) {
        UIView.animate(withDuration: 0.15) { [weak self] in
            self?.topCategoriesLabel.alpha = 1
            self?.leftArrowImageView.alpha = 1
        }
    }
    
    @IBAction func actionTouch(_ sender: Any) {
        UIView.animate(withDuration: 0.15) { [weak self] in
            self?.topCategoriesLabel.alpha = 0.5
            self?.leftArrowImageView.alpha = 0.5
        }
    }
    
    // MARK: config
    func config() {
        configLocalization()
        
        categoriesCollectionView.register(UINib(nibName: idCell, bundle: nil), forCellWithReuseIdentifier: idCell)
    }
    
    // MARK: private
    private func configLocalization() {
        topCategoriesLabel.text = topCategoriesText
    }
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        let model = categories[indexPath.item]
        cell.setupCell(with: model)
        return cell
    }
}
