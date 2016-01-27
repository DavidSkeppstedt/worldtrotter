//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by David Skeppstedt on 2016-01-25.
//  Copyright © 2016 Dixum. All rights reserved.
//

import UIKit

class ConversionViewController : UIViewController, UITextFieldDelegate {
	//MARK: IBOutlets
	@IBOutlet var celsiusLabel:UILabel!
	@IBOutlet var textField:UITextField!

	//MARK: conversion value properties
	var fahrenheitValue:Double?{
		didSet{
			// will be changed as soon as the property changes value.
			updateCelsiusLabel()
		}
	}
	var celsiusValue:Double? {
		if let value = fahrenheitValue {
			return (value - 32) * (5/9)
		}else {
			return nil
		}
	}

	//MARK: Number formatter property
	let numberFormatter: NSNumberFormatter = {
		let nf = NSNumberFormatter()
		nf.numberStyle = .DecimalStyle
		nf.minimumFractionDigits = 0
		nf.maximumFractionDigits = 1
		return nf
	}()

	let numberCharset:NSCharacterSet = {
		let cs = NSCharacterSet.decimalDigitCharacterSet()
		return cs
	}()

	func updateCelsiusLabel() {
		if let value = celsiusValue {
			celsiusLabel.text = numberFormatter.stringFromNumber(value)
		} else {
			celsiusLabel.text = "???"
		}
	}
	//MARK: UITextFieldDelegate methods
	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		let exisitingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
		let replacementTextHasDecimalSeparator = string.rangeOfString(".")


		if let first = string.utf16.first where !numberCharset.characterIsMember(first) {
			return false
		}

		if exisitingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil{
			return false
		}

		return true
	}


	//MARK: IBAction
	@IBAction func fahrenheitFieldEditingChanged(textField:UITextField) {

		if let text = textField.text ,value = Double(text){
			fahrenheitValue = value
		}else {
			fahrenheitValue = nil
		}
	}

	@IBAction func dismissKeyboard(send:AnyObject) {
		textField.resignFirstResponder()
	}
}