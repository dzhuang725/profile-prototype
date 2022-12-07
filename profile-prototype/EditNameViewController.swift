//
//  EditNameViewController.swift
//  profile-prototype
//
//  Created by Weiqi Zhuang on 12/6/22.
//

import UIKit

class EditNameViewController: UIViewController {

    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!

    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameTextField: UITextField!

    // Allow return to dismiss keyboard
    @IBAction func onFinishEditingFirstName(_ sender: Any) {
        firstNameTextField.resignFirstResponder()
    }
    @IBAction func onFinishEditingLastName(_ sender: Any) {
        lastNameTextField.resignFirstResponder()
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var selected: String!
    
    @IBAction func onUpdate(_ sender: Any) {
        let firstName = self.firstNameTextField.text
        let lastName = self.lastNameTextField.text
        UserDefaults.standard.set(firstName, forKey: "FirstName")
        UserDefaults.standard.set(lastName, forKey: "LastName")
        UserDefaults.standard.set("\(firstName ?? "") \(lastName ?? "")", forKey: selected)
        UserDefaults.standard.set(true, forKey: "userChangedInfo")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Input border style
        self.firstNameView.layer.borderWidth = 1
        self.firstNameView.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        
        self.lastNameView.layer.borderWidth = 1
        self.lastNameView.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        
        // Prompt
        self.titleLabel.text = "What's your name?"
        self.firstNameLabel.text = "Your first name"
        self.lastNameLabel.text = "Your last name"
        
        // Fill text field with stored information
        self.firstNameTextField.text = (UserDefaults.standard.string(forKey: "FirstName") ?? "")
        self.lastNameTextField.text = (UserDefaults.standard.string(forKey: "LastName") ?? "")
        
        // Allow tap white space to dismiss keyboard
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
//    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
//        self.firstNameTextField.resignFirstResponder()
//        self.lastNameTextField.resignFirstResponder()
//        return false
//    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
