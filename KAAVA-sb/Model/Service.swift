//
//  Service.swift
//  KAAVA-sb
//
//  Created by bahadir on 28.12.2020.
//

import Foundation
//import Alamofire
//import SwiftyJSON

struct Service {
    
    static let shared = Service()
    
    func fetchPosts(completion: @escaping ([Posts]?,Error?) -> Void ){
        
        let myapiUrl = "https://kaavabackend.herokuapp.com/posts"
            
        guard let url = URL(string: myapiUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                completion(nil,error)
                return
            }
            if let data = data {
                do{
                    let posts = try JSONDecoder().decode([Posts].self, from: data)
                    completion(posts,nil)
                }catch{
                    print(error)
                    completion(nil,error)
                }
            }
        }.resume()
    }
    
    func fetchComments(completion: @escaping ([Comments]?,Error?) -> Void ){
        
        let myapiUrl = "https://kaavabackend.herokuapp.com/postComments/\(PostViewController.id_deneme)"
            
        guard let url = URL(string: myapiUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("debug 1", error)
                completion(nil,error)
                return
            }
            if let data = data {
                do{
                    let comments = try JSONDecoder().decode([Comments].self, from: data)
                    completion(comments,nil)
                }catch{
                    print("debug2",error)
                    completion(nil,error)
                }
            }
        }.resume()
    }
    
    
    
}
