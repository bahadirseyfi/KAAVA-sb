//
//  PostCell.swift
//  KAAVA-sb
//
//  Created by bahadir on 12.12.2020.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var sender: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    
}
