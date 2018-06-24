//
//  MainTabBarController.swift
//  Unsplash
//
//  Created by Victor Chang on 23/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLayoutSubviews()
		
		let favoritesController = ViewController()
		favoritesController.tabBarItem.title = "Favoritos"
		
		let searchController = UINavigationController(rootViewController: ViewController())
		searchController.tabBarItem.title = "Buscar"
	}
	
	func setupViewControllers() {
		
		viewControllers = [
			
		]
		
	}
	
	fileprivate func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
		
		let navController = UINavigationController(rootViewController: rootViewController)
		
		rootViewController.navigationItem.title = title
		navController.tabBarItem.title = title
		navController.tabBarItem.image = image
		
		return navController
	}
	
}
