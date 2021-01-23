//
//  ViewController.swift
//  KAAVA-sb
//
//  Created by bahadir on 11.12.2020.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var forumUI: UIButton!
    @IBOutlet weak var mapUI: UIButton!
    @IBOutlet weak var buttonUI: UIButton!
    @IBOutlet weak var mapView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonUI.applyDesign(color: UIColor.darkGray, cornerRadius: 9)
        mapUI.applyDesign(color: UIColor.init(red: 2/255, green: 173/255, blue: 181/255, alpha: 1), cornerRadius: 20)
        forumUI.applyDesign(color: UIColor.init(red: 2/255, green: 173/255, blue: 181/255, alpha: 1), cornerRadius: 20)
        
       

        
    }
    
    
    @IBAction func mapClicked(_ sender: UIButton) {
        print("map clicked")
    }
    
    @IBAction func forumClicked(_ sender: UIButton) {
        print("forum clicked")
    }
    
}

extension UIButton {
    func applyDesign(color: UIColor, cornerRadius: Int) {
        self.backgroundColor = color
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.9
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

