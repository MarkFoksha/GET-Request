//
//  NetworkManager.swift
//  GET Request
//
//  Created by Марк Фокша on 11.04.2023.
//

import Foundation

class NetworkManager {
    
    static func performURL(url: String, completion: @escaping ([Posts]?) -> ()) {
        
        let session = URLSession.shared
        guard let url = URL(string: url) else { return }
        
        session.dataTask(with: url) { data, response, error in
            
            if error == nil, let data = data {
                let posts = parseJSON(withData: data)
                completion(posts)
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                } catch let error {
                    print(error.localizedDescription)
                }
            } else {
                print(error!.localizedDescription)
            }
        }.resume()
    }
    
    private static func parseJSON(withData data: Data) -> [Posts]? {
        
        let decoder = JSONDecoder()

        do {
            let posts = try decoder.decode([Posts].self, from: data)
            return posts
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
}
