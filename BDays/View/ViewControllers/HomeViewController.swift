//
//  HomeViewController.swift
//  BDays
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var bdayListView: UITableView!
    
    var viewModel: HomeViewModel? {
        didSet {
            setHandlers()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bdayListView.delegate = viewModel
        bdayListView.dataSource = viewModel
        viewModel?.callBirthdaysAPI()
    }

}

extension HomeViewController {
    
    func setHandlers() {
        
        viewModel?.tableReloadHandler = { [weak self] in
            guard let vc = self else {return}
            vc.bdayListView.reloadData()
        }
        
        viewModel?.errorHandler = { errStr in
            print("errorStr = \(errStr)")
        }
        
    }
    
}
