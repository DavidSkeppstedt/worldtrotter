//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by David Skeppstedt on 2016-01-28.
//  Copyright © 2016 Dixum. All rights reserved.
//

import UIKit
import MapKit
class MapViewController:UIViewController {
	var map:MKMapView!
	override func loadView() {
		//code that builds the view programatically goes here.
		//this creates a new mapview and sets it as the root view.
		map = MKMapView()
		self.view = map
	}

	override func viewDidLoad() {
		print("Hey i am here")
	}
}
