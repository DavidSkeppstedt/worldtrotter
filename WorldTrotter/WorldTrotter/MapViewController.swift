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

		let segmentController = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
		segmentController.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
		segmentController.selectedSegmentIndex = 0
		segmentController.translatesAutoresizingMaskIntoConstraints = false

		self.view.addSubview(segmentController)

		let topConstrian = segmentController.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor,constant: 8)
		let margins = view.layoutMarginsGuide
		let leadingConstrian = segmentController.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
		let trailingConstrian = segmentController.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)

		topConstrian.active = true
		leadingConstrian.active = true
		trailingConstrian.active = true

		segmentController.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)

	}

	func mapTypeChanged(segControl:UISegmentedControl) {
		switch segControl.selectedSegmentIndex {
		case 0:
			map.mapType = .Standard
		case 1:
			map.mapType = .Hybrid
		case 2:
			map.mapType = .Satellite
		default:
			break
		}
	}

	override func viewDidLoad() {
		print("Hey i am here")
	}
}
