//
//  ExploreViewController.swift
//  TestForSolvelt
//
//  Created by Наталия Семичева on 7/30/19.
//  Copyright © 2019 Наталия Семичева. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        configGesture()
        stackView.heightAnchor.constraint(equalToConstant: 680).isActive = true
        addController(with: "PlacesViewController")
        addController(with: "CategoriesViewController")
    }
    
    // MARK: Actions
    @objc func actionTap() {
        searchTextField.resignFirstResponder()
    }
    
    // MARK: Private
    private func configGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionTap))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    private func addController(with id: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let screen = storyboard.instantiateViewController(withIdentifier: id)
        addChildController(child: screen)
        
        screen.view.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(screen.view)
        
        screen.didMove(toParent: self)
        screen.view.layoutIfNeeded()
        
        if let screen = screen as? PlacesViewController {
            //load info from bussiness layer
            let places = loadPlaces()
            screen.setPlaces(places)
            screen.view.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 74).isActive = true
        } else if let screen = screen as? CategoriesViewController {
            //load info from bussiness layer
            let categories = loadCategories()
            screen.setCategories(categories)
            screen.view.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 500).isActive = true
        }
    }
    
    private func addChildController(child: UIViewController) {
        self.addChild(child)
        child.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(child.view)
        self.view.bringSubviewToFront(child.view)
        child.didMove(toParent: self)
    }
    
    // MARK: hardcore
    private func loadPlaces() -> [Place] {
        let place1 = Place(name: "Rahat Brasserie", description: "124 Levent\\Besiktas", rating: 4.9, namuberOfVoting: 120, image: UIImage(named: "test_image1"), isFreeDelivery: true)
        let place2 = Place(name: "Garage Bar", description: "124 Levent\\Besiktas", rating: 4.9, namuberOfVoting: 120, image: UIImage(named: "test_image2"), isFreeDelivery: true)
        let places = [place1, place2]
        return places
    }
    
    private func loadCategories() -> [Category] {
        let category1 = Category(name: "Pizza", numberOfPlaces: 2350, image: UIImage(named: "pizza"))
        let category2 = Category(name: "​Burgers", numberOfPlaces: 350, image: UIImage(named: "burger"))
        let category3 = Category(name: "​Steak", numberOfPlaces: 834, image: UIImage(named: "meat"))
        let category4 = Category(name: "​Pasta", numberOfPlaces: 150, image: UIImage(named: "pasta"))
        let categories = [category1, category2, category3, category4]
        return categories
    }
}

extension ExploreViewController: UITextFieldDelegate {
}
