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
    
    var numberOfProducts: Int {
        var count:Int = 0
        for collection in collections {
            count += collection.products.count
        }
        return count
    }
    
    override init() {
        super.init()
    }
    
    
    func numberOfItems(inSection section:Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return numberOfProducts
        default:
            return 0
        }
    }
    
    
    func fetchData(completion:@escaping ()->()?) {
        guard let url = URL(string: "https://gist.githubusercontent.com/la-ursic/3c5f25d5ee955ee9a6e493ac57884b9c/raw/5fab9af8e1f4db60419ba3a8da9f138cbb3a8461/Wish%2520lists") else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else{
                print(error!.localizedDescription)
                DispatchQueue.main.async {
                    completion()
                }
                return
            }
            self.collections = []
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let json = responseJSON as? [[String:AnyObject]]{
                for element in json {
                    let collection = CollectionViewModel(collection: Collection(dictionary: element))
                    self.collections.append(collection)
                }
            }
            DispatchQueue.main.async {
                completion()
            }
        }
        task.resume()
    }
    
    func getProductFromAllProducts(withIndex index:Int) -> ProductViewModel {
        if index < collections[0].products.count {
            return collections[0].products[index]
        }else{
            return collections[1].products[index-collections[0].products.count]
        }
    }
    
}
