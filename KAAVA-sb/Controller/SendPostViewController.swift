//
//  SendPostViewController.swift
//  KAAVA-sb
//
//  Created by bahadir on 31.12.2020.
//

import UIKit

class SendPostViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var headerTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var sendButtonUI: UIButton!
    
    var req = APIRequest(endpoint: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        sendButtonUI.applyDesign(color: UIColor.init(red: 2/255, green: 173/255, blue: 181/255, alpha: 1), cornerRadius: 20)
    }

    @IBAction func sendButtonAction(_ sender: UIButton) {
        
        
        // HER TEXTFIELD İÇİN RENK ATAMASI NASIL YAPILMALIDIR ? ?? ? ?
        
        if nameTextField.text == "" || descriptionTextField.text == "" || headerTextField.text == "" {
            print("Bu alanlar boş bırakılamaz")
            nameTextField.backgroundColor = UIColor.red
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
