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
    
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    var colleges : [Colleges] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editBarButton.tag = 0
        
        colleges.append(Colleges(name: "Elmhurst College", state: "Illinois", students: 0, picture: UIImage(named: "nothing")!))
        colleges.append(Colleges(name: "John Carrol University", state: "Ohio", students: 0, picture: UIImage(named: "nothing")!))
        colleges.append(Colleges(name: "Ohio State University", state: "Ohio", students: 0, picture: UIImage(named: "nothing")!))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = collegesTableView.indexPathForSelectedRow?.row
        dvc.name = colleges[index!].name
        dvc.students = colleges[index!].students
        dvc.state = colleges[index!].state
    }
    
    func tableView(collegesTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(collegesTableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = collegesTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].state
        return cell
    }
    
    func tableView(collegesTableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            collegesTableView.reloadData()
        }
    }

    func tableView(collegesTableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(collegesTableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    @IBAction func onEditButtonTapped(sender: AnyObject) {
        if sender.tag == 0
        {
            collegesTableView.editing = true
            editBarButton.tag = 1
        } else {
            collegesTableView.editing = false
            editBarButton.tag = 0
        }
    }
    
    
    @IBAction func onAddButtonTapped(sender: AnyObject)
    {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "College Name"}
        alert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in
            locationTextField.placeholder = "College State"}
        alert.addTextFieldWithConfigurationHandler { (studentsTextField) -> Void in
            studentsTextField.placeholder = "College Students"
            studentsTextField.keyboardType = .NumberPad}
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancel)
        let confirmAddition = UIAlertAction(title: "Confirm", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            let locationTextField = alert.textFields![0] as UITextField
            let studentsTextField = alert.textFields![0] as UITextField
            self.colleges.append(Colleges(name: nameTextField.text!, state: nameTextField.text!, students: studentsTextField.text!))
            self.collegesTableView.reloadData()
        }
        alert.addAction(confirmAddition)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

    



