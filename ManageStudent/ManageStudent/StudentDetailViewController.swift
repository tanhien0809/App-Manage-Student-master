//
//  StudentDetailViewController.swift
//  ManageStudent
//
//  Created by healer on 5/6/17.
//  Copyright © 2017 healer. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {

    var infoStudent: Student?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var universityLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = infoStudent?.getName()
        ageLabel.text = String( describing: infoStudent?.getYearOld())
        universityLabel.text = infoStudent?.getUniversity()
        descriptionLabel.text = infoStudent?.getDescription()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
