//
//  HomeTableViewCell.swift
//  BDays
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import UIKit
import Apollo

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var lbFirstLetter: UILabel!
    @IBOutlet weak var lbNames: UILabel!
    @IBOutlet weak var lbDOB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileView.layer.cornerRadius = 27.5
    }
    
    func config(person: BirthdaysQuery.Data.Person){
        lbFirstLetter.text = person.name.getInitials()
        lbNames.text = person.name
        lbDOB.text = person.dateOfBirth.convertDateFormate()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
