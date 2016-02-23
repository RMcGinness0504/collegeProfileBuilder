//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Robert McGinness on 1/21/16.
//  Copyright © 2016 Robert McGinness. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, SFSafariViewControllerDelegate, UITextFieldDelegate {

    var college : Colleges!
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var collegeDetailImageView: UIImageView!
    @IBOutlet weak var collegeNameTextLabel: UITextField!
    @IBOutlet weak var collegeStateTextLabel: UITextField!
    @IBOutlet weak var collegeStudentsTextLabel: UITextField!
    @IBOutlet weak var collegeUrlTextField: UITextField!
    @IBOutlet weak var collegeLocationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        collegeNameTextLabel.text = college.name
        collegeStateTextLabel.text = college.state
        collegeStudentsTextLabel.text = String(college.students)
        collegeDetailImageView.image = college.picture
        collegeUrlTextField.text = college.url
        collegeLocationTextField.text = college.location
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mapViewSegue" {
            let dvc = segue.destinationViewController as! MapViewController
            dvc.title = sender?.currentTitle
            dvc.collegeLocation = collegeLocationTextField.text!
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.collegeDetailImageView.image = selectedImage
        }
    }
    
    @IBAction func onSaveButtonTapped(sender: AnyObject) {
        
        college.name = collegeNameTextLabel.text!
        college.state = collegeStateTextLabel.text!
        college.students = Int(collegeStudentsTextLabel.text!)!
        college.url = collegeUrlTextField.text!
        college.picture = collegeDetailImageView.image
        college.location = collegeLocationTextField.text!
        
    }
    
    @IBAction func onURLButtonTapped(sender: AnyObject) {
        let url = NSURL(string: college.url)
        let dvc = SFSafariViewController(URL: url!)
        dvc.delegate = self
        presentViewController(dvc, animated: true, completion: nil)
    }


    @IBAction func onLibraryButtonTapped(sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onCameraButtonTapped(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
