//
//  PersonDetailViewController.swift
//  BDays
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    
    @IBOutlet weak var initialsView: UIView!
    @IBOutlet weak var lbInitials: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDob: UILabel!
    @IBOutlet weak var goBackBtn: UIButton!
    
    
    var viewModel: PersonDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()
    }
    
    @IBAction func goBackBtn(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)//popToRootViewController(animated: true)
    }
    
}

extension PersonDetailViewController {
    
    func setValues() {
        lbInitials.text = viewModel?.personDetail?.name.getInitials()
        lbName.text = viewModel?.personDetail?.name
        lbDob.text = viewModel?.personDetail?.dateOfBirth.convertDateFormate()
    }
    
}
