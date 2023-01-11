//
//  Parser.swift
//  HackerNews
//
//  Created by GGS-BKS on 10/01/23.
//

import Foundation

struct Parser {
    func parse(closure : @escaping (NewsModel) ->()) {
        let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
        
        guard let serverURL = URL(string : url) else{
            print ("Server URL is not correct, Kindly recheck")
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: serverURL)) {data, response, error in
            
            if error != nil{
                print (error?.localizedDescription ?? "")
                return
            }
            //Convert data to model
            do{
                let hackerNewsList = try JSONDecoder().decode(NewsModel.self , from: data!)
                closure(hackerNewsList)
            } catch{
                print(error)
            }
        }.resume()
    }
}
