//
//  SettingsViewController.swift
//  HW 2
//
//  Created by Alexey Efimov on 12.06.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
	
	@IBOutlet var colorView: UIView!
	
	@IBOutlet var redLabel: UILabel!
	@IBOutlet var greenLabel: UILabel!
	@IBOutlet var blueLabel: UILabel!
	
	@IBOutlet var redSlider: UISlider!
	@IBOutlet var greenSlider: UISlider!
	@IBOutlet var blueSlider: UISlider!
	
	@IBOutlet var redTF: UITextField!
	@IBOutlet var greenTF: UITextField!
	@IBOutlet var blueTF: UITextField!
	
	var startColor: UIColor!
	var delegate: SettingsViewControllerDelegate!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.hidesBackButton = true
		
		colorView.layer.cornerRadius = 15
		
		getStartColorSettings()
		setupSliders()
		setViewColor()
		setValuesForLabels(for: redLabel, greenLabel, blueLabel)
		setValuesForTF(for: redTF, greenTF, blueTF)
	}
	
	@IBAction func rgbSlider(_ sender: UISlider) {
		setViewColor()
		
		switch sender {
		case redSlider:
			redLabel.text = string(for: redSlider)
			redTF.text = string(for: redSlider)
		case greenSlider:
			greenLabel.text = string(for: greenSlider)
			greenTF.text = string(for: greenSlider)
		default:
			blueLabel.text = string(for: blueSlider)
			blueTF.text = string(for: blueSlider)
		}
	}
	
	@IBAction func doneButtonPressed() {
		guard let color = colorView.backgroundColor else { return }
		delegate.setNewValues(for: color)
		dismiss(animated: true)
	}

// MARK: - Private functions

	private func getStartColorSettings() {
		colorView.backgroundColor = startColor
	}

	private func setupSliders() {
		let component = CIColor(color: startColor)

		redSlider.value = Float(component.red)
		greenSlider.value = Float(component.green)
		blueSlider.value = Float(component.blue)
	}
	
	private func setViewColor() {
		colorView.backgroundColor = UIColor(
			red: CGFloat(redSlider.value),
			green: CGFloat(greenSlider.value),
			blue: CGFloat(blueSlider.value),
			alpha: 1
		)
	}
	
	private func setValuesForLabels(for labels: UILabel...) {
		labels.forEach { label in
			switch label {
			case redLabel:
				redLabel.text = string(for: redSlider)
			case greenLabel:
				greenLabel.text = string(for: greenSlider)
			default:
				blueLabel.text = string(for: blueSlider)
			}
		}
	}
	
	private func setValuesForTF(for textFields: UITextField...) {
		textFields.forEach { textField in
			switch textField {
			case redTF:
				redTF.text = string(for: redSlider)
			case greenTF:
				greenTF.text = string(for: greenSlider)
			default:
				blueTF.text = string(for: blueSlider)
			}
		}
	}
	
	private func string(for slider: UISlider) -> String {
		String(format: "%.2f", slider.value)
	}
}
