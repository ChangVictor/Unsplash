//
//  ViewController.swift
//  Unsplash
//
//  Created by Victor Chang on 23/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
	
	var photoService: PhotoService?
	var photoCollectionViewController: PhotoCollectionViewController?
	// * declaro el textfield afuera para poder usarlo como contraint del boton
	let searchTextField: UITextField = {
		let textField = UITextField()
		textField.placeholder = "Buscar fotos..."
		textField.backgroundColor = UIColor(white: 1, alpha: 0.8)
		textField.borderStyle = .roundedRect
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setBackgroundImage()
		setupNavigationBarItems()
		setupTextField()
		setupSearchButton()

	}
	
	func setBackgroundImage() {
		let backgroundImage: UIImageView = {
			let image = UIImageView(frame: UIScreen.main.bounds)
			image.image = UIImage(named: "backgroundWhite")
			image.contentMode = .scaleAspectFill
			image.translatesAutoresizingMaskIntoConstraints = false
			return image
		}()
		self.view.addSubview(backgroundImage)
		
		NSLayoutConstraint.activate([
			backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
			backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
			backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
			backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
			])
	}
	
	func setupNavigationBarItems() {
		let titleImageView = UIImageView(image: #imageLiteral(resourceName: "iconWhite"))
		navigationItem.titleView = titleImageView
		titleImageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
		titleImageView.contentMode = .scaleAspectFit
		navigationItem.title = "Unsplash"
		navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 35, green: 35, blue: 35)
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white] // FML
	}
	
	func setupTextField(){
		view.addSubview(searchTextField)
		NSLayoutConstraint.activate([
			searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
			searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
			searchTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
			searchTextField.heightAnchor.constraint(equalToConstant: 40)
			])
	}
	
	func setupSearchButton() {
		let searchButton: UIButton = {
			let button = UIButton(type: .system)
			button.setTitle("BUSCAR", for: .normal)
			button.backgroundColor = UIColor.rgb(red: 35, green: 35, blue: 35)
			button.setTitleColor(.white, for: .normal)
			button.layer.cornerRadius = 4
			button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
			button.translatesAutoresizingMaskIntoConstraints = false
			button.addTarget(self, action: #selector(handleSearchPress), for: .touchUpInside)
			return button
		}()
		self.view.addSubview(searchButton)
		NSLayoutConstraint.activate([
			searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 30),
			searchButton.widthAnchor.constraint(equalToConstant: 90),
			searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
	
	@objc func handleSearchPress() {
		if searchTextField.text != "" {
			
			let layout = UICollectionViewFlowLayout()
			let photoTableViewController = PhotoCollectionViewController(collectionViewLayout: layout)
			navigationController?.pushViewController(photoTableViewController, animated: true)
			photoTableViewController.query = searchTextField.text
			print("\(photoTableViewController.query ?? "no query")")
			
		} else if searchTextField.text == "" {
			print("No hay query ingresado")
		}
	}
	
}

