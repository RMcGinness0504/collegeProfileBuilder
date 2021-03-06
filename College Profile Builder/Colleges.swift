//
//  Colleges.swift
//  College Profile Builder
//
//  Created by Robert McGinness on 1/20/16.
//  Copyright © 2016 Robert McGinness. All rights reserved.
//

import UIKit

class Colleges: NSObject {

    var name = ""
    var state = ""
    var students = 0
    var picture = UIImage(named: "nothing")
    var url = ""
    var location = ""
    
    convenience init(name: String, state: String, students: Int, picture: UIImage, url: String, location: String)
    {
        self.init()
        self.name = name
        self.state = state
        self.students = students
        self.picture = picture
        self.url = url
        self.location = location
    }
    
    convenience init(name: String, state: String, students: String, url: String, location: String)
    {
        self.init()
        self.name = name
        self.state = state
        self.students = Int(students)!
        self.url = url
        self.location = location
    }
}
