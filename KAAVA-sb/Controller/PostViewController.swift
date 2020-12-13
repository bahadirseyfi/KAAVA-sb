//
//  PostViewController.swift
//  KAAVA-sb
//
//  Created by bahadir on 12.12.2020.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var senderCell: UILabel!
    @IBOutlet weak var headerCell: UILabel!
    @IBOutlet weak var timeCell: UILabel!
}

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellSpacingHeight: CGFloat = 10
    
    var posts : [Posts] = [
        Posts(sender: "Baho", header: "Consectetur adipiscing elit", time: "4 weeks ago", message: "Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant."),
        
        Posts(sender: "Meral", header: "Euismod in pellentesque mas", time: "4 weeks ago", message: "Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant."),
        
        Posts(sender: "Salih", header: "Consectetur adipiscing elit", time: "4 weeks ago", message: "Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant."),
        
        Posts(sender: "Cemre", header: "Euismod in pellentesque mas", time: "4 weeks ago", message: "cemrenin yazdıkları geldi burayaaaaa."),
        
        Posts(sender: "Halil", header: "HALİL HİLAL yazdıkları geldi burayaaaaa", time: "4 weeks ago", message: "cemrenin yazdıkları geldi burayaaaaa.")
    ]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tıklandı")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")            as! PostsTableViewCell
        let postlar = posts[indexPath.row]
        let harf = postlar.sender
        let ilkharf = harf[harf.index(harf.startIndex, offsetBy: 0)]
        cell.senderCell?.text = String(ilkharf)
        cell.headerCell?.text = postlar.header
        cell.timeCell?.text = postlar.time
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = true
        return cell
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
//        tableView.estimatedRowHeight = 88
//        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = segue.destination as! DetailsViewController
                destVC.headerText = posts[indexPath.row].header
                destVC.senderText = posts[indexPath.row].sender
                destVC.messageText = posts[indexPath.row].message
            }
        }
    }
    
    
}


//extension PostViewController: UITableViewDataSource {
//}
//extension PostViewController: UITableViewDelegate {
//}
