//
//  ViewModel.swift
//  Linio
//
//  Created by Jonathan Velazquez on 30/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    var collections:[CollectionViewModel] = []
    
    override init() {
        super.init()
        self.fetchData()
    }
    
    
    func fetchData() {
        guard let url = URL(string: "https://gist.githubusercontent.com/la-ursic/3c5f25d5ee955ee9a6e493ac57884b9c/raw/5fab9af8e1f4db60419ba3a8da9f138cbb3a8461/Wish%2520lists") else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let json = responseJSON as? [[String:AnyObject]]{
                for element in json {
                    let collection = CollectionViewModel(collection: Collection(dictionary: element))
                    self.collections.append(collection)
                }
            }
        }
        task.resume()
        
    }
    
}
