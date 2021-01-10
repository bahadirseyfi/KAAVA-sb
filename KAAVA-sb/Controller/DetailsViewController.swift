//
//  DetailsViewController.swift
//  KAAVA-sb
//
//  Created by bahadir on 13.12.2020.
//

import UIKit

class CommentsTableViewCell : UITableViewCell {
    var comment : Comments? {
        didSet {
            guard let comment = comment else {return}
            senderComment.text = comment.senderName
            commentText.text = comment.commentPost
        }
    }
    @IBOutlet weak var senderComment: UILabel!
    @IBOutlet weak var commentText: UILabel!
}

extension UILabel {
    func applyDesign(color: UIColor, cornerRadius: Int) {
        self.backgroundColor = color
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.9
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}


class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var comments = [Comments]()

    var headerText : String?
    var senderText : String?
    var messageText : String?
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var sender: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    

    let cellSpacingHeight: CGFloat = 0
    
//    MARK : - View Lifecycle
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tıklandı")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comments.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }
    
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CommentsTableViewCell
        cell.comment = self.comments[indexPath.row]

        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = true
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("BU ÇOOOOOOOK ÖENMLİİİİİİİİİİİİ",PostViewController.id_deneme)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        headerLabel.applyDesign(color: UIColor.init(red: 26/255, green: 30/255, blue: 37/255, alpha: 0.8), cornerRadius: 8)
        messageLabel.applyDesign(color: UIColor.init(red: 26/255, green: 30/255, blue: 37/255, alpha: 0.8), cornerRadius: 8)
        sender.applyDesign(color: UIColor.init(red: 26/255, green: 30/255, blue: 37/255, alpha: 0.8), cornerRadius: 8)
        
        Service.shared.fetchComments { (comments, error) in
            if let error = error {
                print("debug 3", error)
                return
            }
            
            guard let comments = comments else {return}
            
            self.comments = comments
            print(comments)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
