//
//  NewStudentViewController.swift
//  ManageStudent
//
//  Created by healer on 5/6/17.
//  Copyright © 2017 healer. All rights reserved.
//

import UIKit

class NewStudentViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

          @IBOutlet var stName: UITextField!
    @IBOutlet var stAge: UITextField!
    @IBOutlet var stUniversity: UITextField!
    @IBOutlet var stDescription: UITextView!
    @IBOutlet var ScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stAge.keyboardType = UIKeyboardType.decimalPad
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)) , name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addStudent(_ sender: Any) {
        
        if (stName.text!.isEmpty || stUniversity.text!.isEmpty || stAge.text!.isEmpty ) {
            //create alert
            let alert = UIAlertController(title: "Notify", message: "Fill all information Please!", preferredStyle: UIAlertControllerStyle.alert);
            //add an action
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil));
            //show alert
            self.present(alert, animated: true, completion: nil);
            
        }
        else{
            NewStudent.isLoadData = true
            let st : Student = Student(name: stName.text!, university: stUniversity.text!, description: stDescription.text!, yearOld: Int(stAge.text!)! )
            
            NewStudent.student = st
            self.navigationController?.popViewController(animated: true)
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        //ScrollView.setContentOffset(CGPoint(x:0,y:250), animated: true)
        self.stName = textField
        self.stAge = textField
        self.stUniversity = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.stName = nil
        self.stAge = nil
        self.stUniversity = nil
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.stDescription = textView
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        self.stDescription = nil
    }
    
    func keyboardDidShow(notification: NSNotification) {
        
        if let activeField = self.stUniversity, let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            self.ScrollView.contentInset = contentInsets
            self.ScrollView.scrollIndicatorInsets = contentInsets
            var aRect = self.view.frame
            aRect.size.height -= keyboardSize.size.height
            if (!aRect.contains(activeField.frame.origin)) {
                self.ScrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardDidHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        self.ScrollView.contentInset = contentInsets
        self.ScrollView.scrollIndicatorInsets = contentInsets
        
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
