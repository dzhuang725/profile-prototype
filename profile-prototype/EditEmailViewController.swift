//
//  EditEmailViewController.swift
//  profile-prototype
//
//  Created by Weiqi Zhuang on 12/6/22.
//

import UIKit

class EditEmailViewController: UIViewController {

    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func finishEditing(_ sender: Any) {
        editTextField.resignFirstResponder()
    }
    var selected: String!
    
    @IBAction func onUpdate(_ sender: Any) {
        UserDefaults.standard.set(self.editTextField.text, forKey: selected)
        UserDefaults.standard.set(true, forKey: "userChangedInfo")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayView.layer.borderWidth = 1
        self.displayView.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        
        self.titleLabel.text = "What's your email?"
        self.sectionLabel.text = "Your Email Address"
        
        self.editTextField.text = (UserDefaults.standard.string(forKey: selected) ?? "")
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
