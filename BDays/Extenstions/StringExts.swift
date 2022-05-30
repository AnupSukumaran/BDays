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
    
    func ageValue(from: String = "yyyy-MM-dd") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        guard let date = dateFormatter.date(from: self), let diffInDays = Calendar.current.dateComponents([.year], from: date, to: Date()).year else {return "-"}
        
        guard diffInDays >= 1 else {
            guard let months = Calendar.current.dateComponents([.month], from: date, to: Date()).month else {return ""}
            return "\(months) month(s) old"
        }
        

        return "\(diffInDays) year(s) old"
    }
    
}
