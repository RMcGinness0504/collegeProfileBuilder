//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Robert McGinness on 1/21/16.
//  Copyright © 2016 Robert McGinness. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate {

    var college : Colleges!
    
    @IBOutlet weak var collegeDetailImageView: UIImageView!
    @IBOutlet weak var collegeNameTextLabel: UITextField!
    @IBOutlet weak var collegeStateTextLabel: UITextField!
    @IBOutlet weak var collegeStudentsTextLabel: UITextField!
    @IBOutlet weak var collegeUrlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeNameTextLabel.text = college.name
        collegeStateTextLabel.text = college.state
        collegeStudentsTextLabel.text = String(college.students)
        collegeDetailImageView.image = college.picture
        collegeUrlTextField.text = college.url
    }
    @IBAction func onSaveButtonTapped(sender: AnyObject) {
        
        college.name = collegeNameTextLabel.text!
        college.state = collegeStateTextLabel.text!
        college.students = Int(collegeStudentsTextLabel.text!)!
        college.url = collegeUrlTextField.text!
    }
    
    @IBAction func onURLButtonTapped(sender: AnyObject) {
        let url = NSURL(string: college.url)
        let dvc = SFSafariViewController(URL: url!)
        dvc.delegate = self
        presentViewController(dvc, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
