//
//  Posts.swift
//  KAAVA-sb
//
//  Created by bahadir on 12.12.2020.
//

import Foundation


struct Posts : Decodable {
    let id : Int
    let name : String
    let postDescription : String
    let postLike : Int
    let postName : String
}

struct Comments : Decodable {
    let commentPost : String
    let commentTime : String
    let senderName : String
}

struct PostLike : Codable {
    let id: Int
    let postLike: Int
}

//final class PostLike :
