//
//  CameraViewController.swift
//  profile-prototype
//
//  Created by Weiqi Zhuang on 12/7/22.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func onUpdate(_ sender: Any) {
        // Go back to previous viewController with image sent back
        if let viewController = self.navigationController?.viewControllers[0] as? ProfileViewController {
            viewController.profileImageView.image = self.profileImageView.image
            UserDefaults.standard.set(true, forKey: "changedProfilePic")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        // Photo library used for test purpose
        picker.sourceType = .photoLibrary
        // Use photo library when camera is unavailable
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            picker.sourceType = .camera
//        }else{
//            picker.sourceType = .photoLibrary
//        }
        // Photo library used for test purpose
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    var oldProfileImage: UIImage!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        profileImageView.image = image
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleLabel.text = "Upload a photo of yourself"
        if UserDefaults.standard.bool(forKey: "changedProfilePic"){
            self.profileImageView.image = oldProfileImage
        }
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
