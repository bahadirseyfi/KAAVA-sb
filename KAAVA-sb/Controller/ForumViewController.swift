//
//  ForumViewController.swift
//  KAAVA-sb
//
//  Created by bahadir on 12.12.2020.
//

import UIKit


class ForumViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts : [Posts] = [
        Posts(sender: "B", header: "Consectetur adipiscing elit", time: "4 weeks ago", message: "Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant."),
        
        Posts(sender: "M", header: "Euismod in pellentesque mas", time: "4 weeks ago", message: "Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant."),
        
        Posts(sender: "S", header: "Consectetur adipiscing elit", time: "4 weeks ago", message: "Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant."),
        
        Posts(sender: "C", header: "Euismod in pellentesque mas", time: "4 weeks ago", message: "Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant.")
    ]

override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
}

extension ForumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! PostCell
        cell.header.text = posts[indexPath.row].header
        cell.message.text = posts[indexPath.row].message
        cell.sender.text = posts[indexPath.row].sender
        return cell
    }
}
extension ForumViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
