//
//  SendPostViewController.swift
//  KAAVA-sb
//
//  Created by bahadir on 31.12.2020.
//

import UIKit
import Pastel

class SendPostViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var headerTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var sendButtonUI: UIButton!
    
    var req = APIRequest(endpoint: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pastelView = PastelView(frame: view.bounds)
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        pastelView.animationDuration = 3.0
        pastelView.setColors([UIColor(red: 20/255, green: 159/255, blue: 166/255, alpha: 1.0),
                              UIColor(red: 37/255, green: 41/255, blue: 48/255, alpha: 1.0),
                              UIColor(red: 252/255, green: 13/255, blue: 80/255, alpha: 1.0),
                              UIColor(red: 37/255, green: 41/255, blue: 48/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)

        self.hideKeyboardWhenTappedAround()
        //sendButtonUI.applyDesign(color: UIColor.init(red: 2/255, green: 173/255, blue: 181/255, alpha: 1), cornerRadius: 20)
        sendButtonUI.applyDesign(color: UIColor.init(white: 1, alpha: 0.75), cornerRadius: 20)
        sendButtonUI.titleLabel?.textColor = UIColor.init(red: 2/255, green: 173/255, blue: 181/255, alpha: 1)
        sendButtonUI.titleLabel?.font = UIFont(name: "Avenir" , size: 17)
    }

    @IBAction func sendButtonAction(_ sender: UIButton) {
        
        
        // HER TEXTFIELD İÇİN RENK ATAMASI NASIL YAPILMALIDIR ? ?? ? ?
        
        if nameTextField.text == "" || descriptionTextField.text == "" || headerTextField.text == "" {
            print("Bu alanlar boş bırakılamaz")
            nameTextField.layer.borderColor = UIColor.red.cgColor
            nameTextField.layer.borderWidth = 1
            descriptionTextField.backgroundColor = UIColor.red
        } else {
            req.sendRequest(name: nameTextField.text!, descript: descriptionTextField.text!, header: headerTextField.text!)
            nameTextField.backgroundColor = UIColor.white
            descriptionTextField.backgroundColor = UIColor.white
        }
        
    }
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
