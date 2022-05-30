//
//  UIViewController+Ext.swift
//  BDays
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func navPush(_ vc: UIViewController, title: String = "") {
       navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
       vc.navigationItem.setHidesBackButton(true, animated: true)
       navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:
    func showPersonDetailViewController(personDetail: BirthdaysQuery.Data.Person?) {
        guard let vc = UIStoryboard.personDetailViewController() else {return}
        vc.viewModel = PersonDetailViewModel(personDetail: personDetail)
        navPush(vc)
//        present(vc, animated: true, completion: nil)
    }
    
}
