//
//  CollectionViewModel.swift
//  Linio
//
//  Created by Jonathan Velazquez on 30/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import Foundation

class CollectionViewModel: CollectionProtocol {
    private var collection:Collection
    
    var id: String {
        return collection.id
    }
    var name: String {
        return collection.name
    }
    var description: String {
        return collection.description
    }
    var defaultCollection: Bool {
        return collection.defaultCollection
    }
    var creationDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-ddTHH:mm:ss+SSSZ"
        return formatter.date(from: collection.creationDate)
    }
    var visibility: Bool {
        return collection.visibility
    }
    var accesHash:String {
        return collection.accesHash
    }
    var products:[ProductViewModel] {
        return collection.products
    }
    
    var owner: PersonViewModel? {
        return collection.owner
    }
    
    init(collection:Collection) {
        self.collection = collection
    }

}
