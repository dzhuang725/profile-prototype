//
//  EditPhoneViewController.swift
//  profile-prototype
//
//  Created by Weiqi Zhuang on 12/6/22.
//

import UIKit

class EditPhoneViewController: UIViewController {

    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    // Allow return to dismiss keyboard
    @IBAction func finishEditing(_ sender: Any) {
        editTextField.resignFirstResponder()
    }
    
    var selected: String!
    
    @IBAction func onUpdate(_ sender: Any) {
        var newNumber = self.editTextField.text
        // If only 10 digits is entered, format them into phone number
        if newNumber?.count == 10 && newNumber!.rangeOfCharacter(from: NSCharacterSet.decimalDigits.inverted) == nil {
            newNumber = formatNumber(number: newNumber!)
        }
        UserDefaults.standard.set(newNumber, forKey: selected)
        UserDefaults.standard.set(true, forKey: "userChangedInfo")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Input border style
        self.displayView.layer.borderWidth = 1
        self.displayView.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        
        // Prompt
        self.titleLabel.text = "What's your phone number?"
        self.sectionLabel.text = "Your phone number"
        
        // Fill text field with stored information
        self.editTextField.text = (UserDefaults.standard.string(forKey: selected) ?? "")
        
        // Allow tap white space to dismiss keyboard
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    func formatNumber ( number: String ) -> String{
        let firstIndex = number.index(number.startIndex, offsetBy: 3)
        let lastIndex = number.index(number.endIndex, offsetBy: -4)
        
        let firstThree = number.prefix(upTo: firstIndex)
        let middleThree = number[firstIndex..<lastIndex]
        let lastFour = number.suffix(from: lastIndex)
        
        let modifiedNumber = "(\(firstThree))\(middleThree)-\(lastFour)"
        print(modifiedNumber)
        return modifiedNumber
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
