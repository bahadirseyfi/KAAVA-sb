//
//  PostViewController.swift
//  KAAVA-sb
//
//  Created by bahadir on 12.12.2020.
//

import UIKit
import Alamofire
import SwiftyJSON

class PostsTableViewCell: UITableViewCell {
    var post : Posts? {
        didSet {
            guard let post = post else {return}
            senderCell.text = post.name
            headerCell.text = post.postName
            timeCell.text = String(post.postLike)
        }
    }
    @IBOutlet weak var senderCell: UILabel!
    @IBOutlet weak var headerCell: UILabel!
    @IBOutlet weak var timeCell: UILabel!
}

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static var id_deneme : Int = 0

    var posts = [Posts]()
    var comments = [Comments]()
    
    @IBOutlet weak var tableView: UITableView!
    let cellSpacingHeight: CGFloat = 0
    
    //var posts : [Posts] = []
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tıklandı")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PostsTableViewCell
        cell.post = self.posts[indexPath.row]

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
        
        Service.shared.fetchPosts { (posts, error) in
            if let error = error{
                print(error)
                return
            }
            guard let posts = posts else { return }
            self.posts = posts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        Service.shared.fetchComments { (comments, error) in
            if let error = error {
                print("debug 3", error)
                return
            }
            
            guard let comments = comments else {return}
            
            self.comments = comments
            print(comments)
        }

       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = segue.destination as! DetailsViewController
                
                destVC.headerText = self.posts[indexPath.row].postName
                destVC.senderText = self.posts[indexPath.row].name
                destVC.messageText = self.posts[indexPath.row].postDescription
                
                PostViewController.id_deneme = self.posts[indexPath.row].id
            }
        }
    }
}
