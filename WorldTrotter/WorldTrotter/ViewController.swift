//
//  ViewController.swift
//  WorldTrotter
//
//  Created by David Skeppstedt on 2016-01-24.
//  Copyright © 2016 Dixum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
		let firstView = UIView(frame: firstFrame)
		firstView.backgroundColor = UIColor.blueColor()
		self.view.addSubview(firstView)

	}
}