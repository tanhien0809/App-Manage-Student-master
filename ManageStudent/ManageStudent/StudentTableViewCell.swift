//
//  StudentTableViewCell.swift
//  ManageStudent
//
//  Created by healer on 5/6/17.
//  Copyright © 2017 healer. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet var icon: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var age: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
