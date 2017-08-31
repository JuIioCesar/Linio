//
//  Person.swift
//  Linio
//
//  Created by Jonathan Velazquez on 30/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import Foundation

protocol PersonProtocol {
    var name: String {get}
    var email: String  {get}
    var linioId: String  {get}
}

class Person {
    var name: String = ""
    var email: String = ""
    var linioId: String = ""
    
    init(){}
    
    init(dictionary: [String:AnyObject]) {
        
    }
}
