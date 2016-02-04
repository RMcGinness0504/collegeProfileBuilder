//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Robert McGinness on 1/21/16.
//  Copyright © 2016 Robert McGinness. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var college : Colleges!
    
    @IBOutlet weak var collegeDetailImageView: UIImageView!
    @IBOutlet weak var collegeNameTextLabel: UITextField!
    @IBOutlet weak var collegeStateTextLabel: UITextField!
    @IBOutlet weak var collegeStudentsTextLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeNameTextLabel.text = college.name
        collegeStateTextLabel.text = college.state
        collegeStudentsTextLabel.text = String(college.students)
        collegeDetailImageView.image = college.picture
    }
    @IBAction func onSaveButtonTapped(sender: AnyObject) {
        
        college.name = collegeNameTextLabel.text!
        college.state = collegeStateTextLabel.text!
        college.students = Int(collegeStudentsTextLabel.text!)!
    }

}
