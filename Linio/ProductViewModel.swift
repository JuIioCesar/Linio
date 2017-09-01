//
//  ProductViewModel.swift
//  Linio
//
//  Created by Jonathan Velazquez on 30/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import Foundation
import UIKit

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
    var linioPlusLevel: UIImage? {
        if product.linioPlusLevel == 1 {
            return #imageLiteral(resourceName: "ndIc30PlusSquare")
        }else if product.linioPlusLevel == 2 {
            return #imageLiteral(resourceName: "ndIc30Plus48Square")
        }else{
            return nil
        }
    }
    var condition: UIImage? {
        if product.condition == .new {
            return #imageLiteral(resourceName: "ndIc30NewSquare")
        }else if product.condition == .refurbished {
            return #imageLiteral(resourceName: "ndIc30RefurbishedSquare")
        }else{
            return nil
        }
    }
    var freeShipping: UIImage? {
        if product.freeShipping {
            return #imageLiteral(resourceName: "ndIc30FreeShippingSquare")
        }else{
            return nil
        }
    }
    var imported: UIImage? {
        if product.imported{
            return #imageLiteral(resourceName: "ndIc30InternationalSquare")
        }else{
            return nil
        }
    }
    var active: Bool {
        return product.active
    }
    
    
    
    init(product:Product) {
        self.product = product
    }
    
}
