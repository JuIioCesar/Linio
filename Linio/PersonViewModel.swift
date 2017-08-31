//
//  PersonViewModel.swift
//  Linio
//
//  Created by Jonathan Velazquez on 31/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import Foundation

class PersonViewModel: NSObject, PersonProtocol {
    private var person:Person
    
    var name: String {
        return person.name
    }
    var email: String  {
        return person.email
    }
    var linioId: String  {
        return person.linioId
    }
    
    init(person:Person) {
        self.person = person
    }
}
