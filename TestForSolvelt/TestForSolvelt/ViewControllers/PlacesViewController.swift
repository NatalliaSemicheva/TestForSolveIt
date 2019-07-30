//
//  PlacesViewController.swift
//  TestForSolvelt
//
//  Created by Наталия Семичева on 7/30/19.
//  Copyright © 2019 Наталия Семичева. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placesCollectionView: UICollectionView!
    
    private var places = [Place]()
    
    private let idCell = "PlaceCollectionViewCell"
    private let titleText = "Discovery new places"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
    
    func setPlaces(_ places: [Place]) {
        self.places = places
        placesCollectionView.reloadData()
    }
    
    // MARK: Config
    func config() {
        configLocalization()
        
        placesCollectionView.register(UINib(nibName: idCell, bundle: nil), forCellWithReuseIdentifier: idCell)
    }
    
    // MARK: private
    private func configLocalization() {
        titleLabel.text = titleText
    }
}

extension PlacesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as? PlaceCollectionViewCell else {
            return UICollectionViewCell()
        }
        let model = places[indexPath.item]
        cell.setupCell(with: model)
        return cell
    }
}
