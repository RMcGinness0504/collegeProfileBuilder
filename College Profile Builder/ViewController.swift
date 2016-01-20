//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Robert McGinness on 1/20/16.
//  Copyright © 2016 Robert McGinness. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collegesTableView: UITableView!
    
    var colleges : [Colleges] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colleges.append(Colleges(name: "Elmhurst College", state: "Illinois", students: 0, picture: UIImage(named: "nothing")!))
        colleges.append(Colleges(name: "John Carrol University", state: "Ohio", students: 0, picture: UIImage(named: "nothing")!))
        colleges.append(Colleges(name: "Ohio State University", state: "Ohio", students: 0, picture: UIImage(named: "nothing")!))
    }
    
    func collegeTableView(collegesTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func collegeTableView(collegesTableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = collegesTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        return cell
    }
    


}

