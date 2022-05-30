//
//  HomeViewController.swift
//  BDays
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import UIKit
import SASCustomAlert

class HomeViewController: UIViewController {
    
    @IBOutlet weak var bdayListView: UITableView!
    @IBOutlet weak var activityIndic: UIActivityIndicatorView!
    
    var viewModel: HomeViewModel? {
        didSet {
            setHandlers()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bdayListView.delegate = viewModel
        bdayListView.dataSource = viewModel
        activityStartAction(true)
        viewModel?.callBirthdaysAPI()
    }

}

extension HomeViewController {
    
    func setHandlers() {
        
        viewModel?.tableReloadHandler = { [weak self] in
            guard let vc = self else {return}
            vc.activityStartAction(false)
            vc.bdayListView.reloadData()
        }
        
        viewModel?.errorHandler = { [weak self] errStr in
            guard let vc = self else {return}
            vc.activityStartAction(false)
            print("errorStr = \(errStr)")
            UIAlertController.showAlert(title: "Message", message: "", buttonTitle:"OK", selfClass: vc)
        }
        
        viewModel?.didSelectRowAtIndex = { [weak self] personData in
            guard let vc = self else {return}
            vc.showPersonDetailViewController(personDetail: personData)
        }
        
    }
    
    func activityStartAction(_ begin: Bool) {
        self.view.isUserInteractionEnabled = !begin
        self.view.alpha = begin ? 0.5 : 1
        
        guard begin else {
            activityIndic.stopAnimating()
            return
            
        }
        activityIndic.startAnimating()
        
        
    }
    

    
}
