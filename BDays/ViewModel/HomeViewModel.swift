//
//  HomeViewModel.swift
//  BDays
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import Foundation
import UIKit

class HomeViewModel: NSObject {
    
    var personsArr = [BirthdaysQuery.Data.Person]()
    
    var tableReloadHandler: (() -> ())?
    var didSelectRowAtIndex: ((BirthdaysQuery.Data.Person) -> ())?
    var errorHandler: ((String) -> ())?
}

extension HomeViewModel {
    
    func callBirthdaysAPI() {
        
        Network.shared.callBirthdaysAPI { result in
            switch result {
            case .success(let personArrData):
                DispatchQueue.main.async {
                    self.personsArr = personArrData
                    self.tableReloadHandler?()
                }
                
            case .failure(let err, _):
                self.errorHandler?(err)
            }
        }
        
    }
    
}

extension HomeViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: .homeTableViewCell, for: indexPath) as? HomeTableViewCell else {
            fatalError("HomeTableViewCell missing!!")
        }
        
        cell.config(person: personsArr[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAtIndex?(personsArr[indexPath.row])
    }
    
    
}
