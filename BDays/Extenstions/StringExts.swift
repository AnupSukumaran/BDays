//
//  StringExts.swift
//  BDays
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import Foundation
import UIKit

extension String {
    
    func getInitials() -> Self {
        return self.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
    }
    
    func convertDateFormate(from: String = "yyyy-MM-dd", to: String = "dd-MM-yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = to
        return  dateFormatter.string(from: date!)

    }
    
}
