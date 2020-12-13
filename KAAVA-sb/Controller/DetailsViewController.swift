//
//  DetailsViewController.swift
//  KAAVA-sb
//
//  Created by bahadir on 13.12.2020.
//

import UIKit

class DetailsViewController: UIViewController {

    var headerText : String?
    var senderText : String?
    var messageText : String?
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var sender: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
//    MARK : - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let headerText = headerText {
            headerLabel.text = headerText
        }
        if let senderText = senderText {
            sender.text = senderText
        }
        if let messageText = messageText {
            messageLabel.text = messageText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
