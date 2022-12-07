//
//  ProfileViewController.swift
//  profile-prototype
//
//  Created by Weiqi Zhuang on 12/6/22.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var imagesView: UIView!
    @IBOutlet weak var editPictureImageView: UIImageView!
    
    @IBAction func onProfileButton(_ sender: Any) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController {
            if UserDefaults.standard.bool(forKey: "changedProfilePic") {
                viewController.oldProfileImage = self.profileImageView.image
            }
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    var sections = ["Name", "Phone", "Email", "Tell us about your self"]
    var defaultContent = ["Micah Smith", "(208)206-5039", "micahsmith@gmail.com", "Hi my name is Mica Smith. I am from Mesa but goto school in Salt Lake City. \n I make this drive all the time and have plenty"] as [Any]
    var selectedSection = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        // Set default values
        UserDefaults.standard.set(false, forKey: "userChangedInfo")
        UserDefaults.standard.set("Micah", forKey: "FirstName")
        UserDefaults.standard.set("Smith", forKey: "LastName")
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Round shape profile photo
        profileImageView.layer.borderWidth = 5
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor(red: 12/255, green: 74/255, blue: 1, alpha: 1).cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        
        editPictureImageView.backgroundColor = UIColor.white
        editPictureImageView.layer.cornerRadius = editPictureImageView.frame.height/2

        if UserDefaults.standard.bool(forKey: "userChangedInfo"){
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoCell

        let section = sections[indexPath.row]
        cell.titleLabel.text = section

        if UserDefaults.standard.bool(forKey: "userChangedInfo") == false{
            UserDefaults.standard.set(defaultContent[indexPath.row], forKey: section)
            //print(UserDefaults.standard.value(forKey: section) as Any)
        }
        
        cell.infoLabel.text = UserDefaults.standard.value(forKey: section) as? String
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSection = sections[indexPath.row]
        
        switch selectedSection {
        case "Name":
            if let viewController = storyboard?.instantiateViewController(withIdentifier: "EditNameViewController") as? EditNameViewController {
                viewController.selected = selectedSection
                navigationController?.pushViewController(viewController, animated: true)
            }
        case "Phone":
            if let viewController = storyboard?.instantiateViewController(withIdentifier: "EditPhoneViewController") as? EditPhoneViewController {
                viewController.selected = selectedSection
                navigationController?.pushViewController(viewController, animated: true)
            }
        case "Email":
            if let viewController = storyboard?.instantiateViewController(withIdentifier: "EditEmailViewController") as? EditEmailViewController {
                viewController.selected = selectedSection
                navigationController?.pushViewController(viewController, animated: true)
            }
        case "Tell us about your self":
            if let viewController = storyboard?.instantiateViewController(withIdentifier: "EditSelfViewController") as? EditSelfViewController {
                viewController.selected = selectedSection
                navigationController?.pushViewController(viewController, animated: true)
            }
        default:
            print("default switch reached")
        }
    }

}

