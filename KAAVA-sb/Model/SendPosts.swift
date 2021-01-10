//
//  SendPosts.swift
//  KAAVA-sb
//
//  Created by bahadir on 31.12.2020.
//

import Foundation

final class SendPosts : Codable {
    
    let name : String
    let postDescription : String
    let postLike : Int
    let postName : String
    let postTime: String
    
    init(name: String, postDescription: String, postlike: Int, postName: String, postTime: String) {
        self.name = name
        self.postDescription = postDescription
        self.postLike = postlike
        self.postName = postName
        self.postTime = postTime
    }
}
