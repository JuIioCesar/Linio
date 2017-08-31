//
//  Product.swift
//  Linio
//
//  Created by Jonathan Velazquez on 29/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import Foundation

public enum ProductConditionType:String {
    case new = "new"
    case refurbished = "refurbished"
    case none
}

protocol ProductProtocol {
    var id: String {get}
    var name: String {get}
    var wishListPrice: Double {get}
    var slug: String {get}
    var url: String {get}
    var imageURL: URL? {get}
    var linioPlusLevel: Int {get}
    var condition: ProductConditionType {get}
    var freeShipping: Bool {get}
    var imported: Bool {get}
    var active: Bool {get}
}


class Product {
    var id: String = ""
    var name: String = ""
    var wishListPrice: Double = Double()
    var slug: String = ""
    var url: String = ""
    var imageURL: String = ""
    var linioPlusLevel: Int = Int()
    var condition: ProductConditionType = .none
    var freeShipping: Bool = false
    var imported: Bool = false
    var active: Bool = false
    
    init(dictionary: [String:AnyObject]) {
        id = dictionary["id"] as? String ?? ""
        name = dictionary["name"] as? String ?? ""
        wishListPrice = dictionary["wishListPrice"] as? Double ?? Double()
        slug = dictionary["slug"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        imageURL = dictionary["image"] as? String ?? ""
        linioPlusLevel = dictionary["linioPlusLevel"] as? Int ?? Int()
        condition = ProductConditionType(rawValue: dictionary["conditionType"] as? String ?? "") ?? .none
        freeShipping = dictionary["freeShipping"] as? Bool ?? false
        imported = dictionary["imported"] as? Bool ?? false
        active = dictionary["active"] as? Bool ?? false
    }
    
}
