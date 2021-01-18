//
//  APIRequest.swift
//  KAAVA-sb
//
//  Created by bahadir on 31.12.2020.
//

import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct APIRequest {
    let resourceURL : URL
    init(endpoint: String) {
        
        //endpoint = https://kaavabackend.herokuapp.com/posts
        
        let resourceString = "https://kaavabackend.herokuapp.com/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
         
        self.resourceURL = resourceURL
    }
    
    func save(_ messageToSave: SendPosts, completion: @escaping(Result<SendPosts, APIError>) -> Void) {
        
        do{
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(messageToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                      let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                do {
                    let messageData = try JSONDecoder().decode(SendPosts.self, from: jsonData)
                    completion(.success(messageData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }
    
    
    func save2(_ messageToSave: SendComments, completion: @escaping(Result<SendComments, APIError>) -> Void) {
        
        do{
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(messageToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                      let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                do {
                    let messageData = try JSONDecoder().decode(SendComments.self, from: jsonData)
                    completion(.success(messageData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }
    
    func likeSave(_ messageToSave: PostLike, completion: @escaping(Result<PostLike, APIError>) -> Void) {
        
        do{
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(messageToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                      let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                do {
                    let messageData = try JSONDecoder().decode(PostLike.self, from: jsonData)
                    completion(.success(messageData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }
    
    func sendRequest(name: String, descript: String, header: String) {
        
        let post = SendPosts(name: name, postDescription: descript, postlike: 0, postName: header, postTime: "Mon Nov 11 2018 07:57:16 GMT+0300 (GMT+03:00)")
        
        let postRequest = APIRequest(endpoint: "posts")
        postRequest.save(post) { result in
            switch result {
            case .success(let message):
                print("The following post has been sent: \(message.postName)")
            case .failure(let error):
                print("An error occured \(error)")
            }
            
        }
        
    }
    
    func sendCommentRequest(id: Int, senderName: String, commentPost: String){
        let comment = SendComments(postID: id, senderName: "guest", commentPost: commentPost, commentTime: "Mon Nov 11 2018 07:57:16 GMT+0300 (GMT+03:00)")
        
        let commentRequest = APIRequest(endpoint: "comments")
        commentRequest.save2(comment) { result in
            switch result {
            case .success(let message):
                print("The following post has been sent: \(message.senderName)")
            case .failure(let error):
                print("An error occured \(error)")
            }
        }
    }
    
    func sendLike(id: Int, postLike: Int){
        let postLike = PostLike(id: id, postLike: postLike)
        
        let likeRequest = APIRequest(endpoint: "postLike")
        likeRequest.likeSave(postLike) { result in
            switch result {
            case .success(let message):
                print("The following post has been sent: \(message.postLike)")
            case .failure(let error):
                print("An error occured \(error.localizedDescription)")
            }
        }
    }
}
