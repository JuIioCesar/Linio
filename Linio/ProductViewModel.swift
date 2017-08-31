//
//  ProductViewModel.swift
//  Linio
//
//  Created by Jonathan Velazquez on 30/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import Foundation

class ProductViewModel: NSObject, ProductProtocol {
    private var product:Product
    
    var id: String {
        return product.id
    }
    var name: String {
        return product.name
    }
    var wishListPrice: Double {
        return product.wishListPrice
    }
    var slug: String {
        return product.slug
    }
    var url: String {
        return product.url
    }
    var imageURL: URL? {
        if let url = URL(string: product.imageURL) {
            return url
        }
        return nil
    }
    var linioPlusLevel: Int {
        return product.linioPlusLevel
    }
    var condition: ProductConditionType {
        return product.condition
    }
    var freeShipping: Bool {
        return product.freeShipping
    }
    var imported: Bool {
        return product.imported
    }
    var active: Bool {
        return product.active
    }
    
    
    
    init(product:Product) {
        self.product = product
    }
    
}
