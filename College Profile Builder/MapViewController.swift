//
//  MapViewController.swift
//  College Profile Builder
//
//  Created by Robert McGinness on 2/22/16.
//  Copyright © 2016 Robert McGinness. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapViewTextField: UITextField!
    
    var collegeLocation = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        mapViewTextField.delegate = self
        mapViewTextField.text = collegeLocation
        findLocation(collegeLocation)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let location = mapViewTextField.text!
        textField.resignFirstResponder()
        findLocation(location)
        return true
    }
    
    func findLocation(location: String)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) -> Void in
            if error != nil{
                print(error)
            }
            else{
            if placemarks!.count > 1 {
                let actionSheetAlert = UIAlertController(title: "Please Choose a Location", message: nil, preferredStyle: .ActionSheet)
                for placemark in placemarks!
                {
                    let locationAlert = UIAlertAction(title: placemark.name!, style: .Default
                            , handler: { (action) -> Void in
                            self.showMapRegion(placemark)
                    })
                    actionSheetAlert.addAction(locationAlert)
                }
                let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                actionSheetAlert.addAction(cancel)
                self.presentViewController(actionSheetAlert, animated: true, completion: nil)
            }else if placemarks?.count == 1 {
                let placemark = placemarks!.first as CLPlacemark!
                self.showMapRegion(placemark)}
            }
        }
    }
    
    func showMapRegion(placemark: CLPlacemark)
    {
        mapViewTextField.text = placemark.name
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = placemark.name
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
    
}
