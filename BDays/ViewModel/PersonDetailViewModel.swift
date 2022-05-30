//
//  PersonDetailViewModel.swift
//  BDays
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import Foundation


class PersonDetailViewModel: NSObject {
    
    var personDetail: BirthdaysQuery.Data.Person?
    
    override init() {}
    
    init(personDetail: BirthdaysQuery.Data.Person?) {
        self.personDetail = personDetail
    }
}
