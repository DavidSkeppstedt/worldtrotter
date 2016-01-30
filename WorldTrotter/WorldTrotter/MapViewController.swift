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
	let locationManager = CLLocationManager()
	override func loadView() {
		super.loadView() // alaways call the super implementation of loadview, but why?
		//code that builds the view programatically goes here.
		//this creates a new mapview and sets it as the root view.
		map = MKMapView()
		self.view = map
		map.showsUserLocation = true

		let	birthPin = MKPointAnnotation()
		birthPin.coordinate = CLLocationCoordinate2DMake(59.329319, 18.068583)
		map.addAnnotation(birthPin)

		let wannaGoPin = MKPointAnnotation()
		wannaGoPin.coordinate = CLLocationCoordinate2DMake(51.507346, -0.127737)
		map.addAnnotation(wannaGoPin)

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

		let positionButton = UIButton(frame: CGRect(x: 0, y: 0, width: 128, height: 64))
		positionButton.translatesAutoresizingMaskIntoConstraints = false
		positionButton.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
		positionButton.addTarget(self, action: "mapLocation:", forControlEvents: .TouchUpInside)
		positionButton.setAttributedTitle(NSAttributedString(string:"Position"), forState: .Normal)

		self.view.addSubview(positionButton)

		let PBbottomConstrain = positionButton.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor)
		let PBleadingConstrain = positionButton.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
		let PBtrailingConstrain = positionButton.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)

		PBbottomConstrain.active = true
		PBleadingConstrain.active = true
		PBtrailingConstrain.active = true


		let zoomButton = UIButton(frame: CGRect(x: 0, y: 500, width: 128, height: 64))
		zoomButton.translatesAutoresizingMaskIntoConstraints = false
		zoomButton.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
		zoomButton.addTarget(self, action: "zoomPin:", forControlEvents: .TouchUpInside)
		zoomButton.setAttributedTitle(NSAttributedString(string:"Zoom"), forState: .Normal)

		self.view.addSubview(zoomButton)



	}

	func zoomPin(but:UIButton){
		//get first annotation
		let aPoint = map.annotations[0]
		let MapPoint = MKMapPointForCoordinate(aPoint.coordinate)
		let pointRect = MKMapRectMake(MapPoint.x, MapPoint.y, 0.1, 0.1)
		let zoomRect = MKMapRectUnion(MKMapRectNull, pointRect)

		map.setVisibleMapRect(zoomRect, animated: true)
	}

	override func viewDidAppear(animated: Bool) {
		locationManager.requestWhenInUseAuthorization()
	}

	func mapLocation(button:UIButton) {
		map.setUserTrackingMode(.Follow, animated: true)
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
