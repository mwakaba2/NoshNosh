//
//  MapViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 5/2/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import MapKit
import UIKit


class MapViewController: UIViewController {


    @IBOutlet weak var mapView: MKMapView!
    var latitude: NSString = ""
    var longitude: NSString = ""
    var name : String = ""
    var location : String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var centerLocation = CLLocationCoordinate2DMake(40.1150,  -88.2728)
        var mapSpan = MKCoordinateSpanMake(0.5, 0.5)
        var mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
        self.mapView.setRegion(mapRegion, animated: true)
        if(self.latitude != ""){
            var latF : Float! = 0
            var longF : Float! = 0
            latF = Float(self.latitude.floatValue)
            longF  = Float(self.longitude.floatValue)
            var lat = NSNumber(float: latF)
            var long = NSNumber(float: longF)
            println("Latitude is \(lat)")
            println("longitude is \(long)")
            var location = CLLocationCoordinate2D(
                latitude: lat as CLLocationDegrees,
                longitude: long as CLLocationDegrees
            )
            var annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = self.name
            annotation.subtitle = self.location
            
            mapView.addAnnotation(annotation)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }





}
