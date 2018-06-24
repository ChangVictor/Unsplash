//
//  ViewController.swift
//  Unsplash
//
//  Created by Victor Chang on 23/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(searchTextField)
		NSLayoutConstraint.activate([
			searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
			searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
			searchTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
			searchTextField.heightAnchor.constraint(equalToConstant: 50)
			])
	}
	
	let searchTextField: UITextField = {
		let textField = UITextField()
		textField.placeholder = "Buscar fotos..."
		textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
		textField.borderStyle = .roundedRect
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()
	
}

