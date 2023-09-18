//
//  APIService.swift
//  0918hw
//
//  Created by 임승섭 on 2023/09/18.
//

import Foundation


class APIService {
   
   static let shared = APIService()
   
   private let key = "ydZ0jSB2_axjqfgjtB_r__tqQb4mep9p-SFq8P5Ru0I"
   
   private init() { }
   
   
   func searchPhoto(query: String, completion: @escaping (Photo?) -> Void ) {
   
       guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(key)") else { return }
       
       let request = URLRequest(url: url)
       
       URLSession.shared.dataTask(with: request) { data, response, error in
           if let error {
               print(error)
               return
           }
           
           guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
               return
           }
           
           do {
               let result = try JSONDecoder().decode(Photo.self, from: data!)
               completion(result)
               
           } catch {
               print(error)
           }
       }.resume()
       
   }
   
}

