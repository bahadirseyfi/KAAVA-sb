//
//  SendComments.swift
//  KAAVA-sb
//
//  Created by bahadir on 18.01.2021.
//

import Foundation

final class SendComments : Codable {

    let postID : Int
    let senderName : String
    let commentPost: String
    let commentTime : String
    
    init(postID: Int, senderName: String, commentPost: String, commentTime: String) {
        self.postID = postID
        self.senderName = senderName
        self.commentPost = commentPost
        self.commentTime = commentTime
    }
}
