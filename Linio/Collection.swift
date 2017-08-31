//
//  Collection.swift
//  Linio
//
//  Created by Jonathan Velazquez on 29/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import Foundation

protocol CollectionProtocol {
    var id: String {get}
    var name: String {get}
    var description: String {get}
    var defaultCollection: Bool {get}
    var creationDate: Date? {get}
    var visibility: Bool {get}
    var accesHash:String {get}
    var products:[ProductViewModel] {get}
    var owner: PersonViewModel? {get}
}

class Collection {
    
    var id: String = ""
    var name: String = ""
    var description: String = ""
    var defaultCollection: Bool = false
    var creationDate: String = ""
    var visibility: Bool = false
    var accesHash:String = ""
    var products:[ProductViewModel] = []
    var owner: PersonViewModel?
    
    
    init(dictionary: [String:AnyObject]) {
        id = dictionary["id"] as? String ?? ""
        name = dictionary["name"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        defaultCollection = dictionary["default"] as? Bool ?? false
        creationDate = dictionary["createdAt"] as? String ?? ""
        visibility = dictionary["visibility"] as? Bool ?? false
        accesHash = dictionary["accessHash"] as? String ?? ""
        
        if let productsDict = dictionary["products"] as? [String:AnyObject] {
            for (_,value) in productsDict {
                if let val = value as? [String:AnyObject] {
                    products.append(ProductViewModel(product: Product(dictionary:val)))
                }
            }
        }
        if let ownerDict =  dictionary["owner"] as? [String : AnyObject] {
            owner = PersonViewModel(person: Person(dictionary: ownerDict))
        }
        
    }
}
