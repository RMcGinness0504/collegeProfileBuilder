//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Robert McGinness on 1/21/16.
//  Copyright © 2016 Robert McGinness. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var name = ""
    var state = ""
    var students = 0
    var picture = UIImage(named: "nothing")
    
    @IBOutlet weak var collegeDetailImageView: UIImageView!
    @IBOutlet weak var collegeNameTextLabel: UITextField!
    @IBOutlet weak var collegeStateTextLabel: UITextField!
    @IBOutlet weak var collegeStudentsTextLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeNameTextLabel.text = name
        collegeStateTextLabel.text = state
        collegeStudentsTextLabel.text = String(students)
    }

}
