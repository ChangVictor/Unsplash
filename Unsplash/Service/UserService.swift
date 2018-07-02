//
//  UserService.swift
//  Unsplash
//
//  Created by Victor Chang on 01/07/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation

class UserService {
	
	func getUser(username: String, completion: @escaping (User) -> ()) {
		
		let userDaataAcces = UserDataAcces()
			userDaataAcces.getUserProfileFromAPI(username) { (response) in
			print("Data Acces obtuvo los datos del usuario")
			completion(response)
		}
		
	}
	
}
