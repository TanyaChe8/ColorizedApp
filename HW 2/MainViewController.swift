//
//  MainViewController.swift
//  HW 2
//
//  Created by Черненко Татьяна Анатольевна on 20.03.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
	func setNewValues(for colorView: UIColor)
}

class MainViewController: UIViewController {
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let settingsVC = segue.destination as? SettingsViewController else { return }
		settingsVC.startColor = view.backgroundColor
		settingsVC.delegate = self
	}
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
	func setNewValues(for colorView: UIColor) {
		view.backgroundColor = colorView
	}
}
