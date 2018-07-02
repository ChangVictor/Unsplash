//
//  UserDataAcces.swift
//  Unsplash
//
//  Created by Victor Chang on 26/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation
import Alamofire

class UserDataAcces {
	
	func getUserProfileFromAPI(_ username: String, completion: @escaping (User) -> ()) {
		
		let urlForUser = "https://api.unsplash.com/users/\(username)?client_id=090e1bedb6a26dec7b7b0c339fc0b8b70218f9a43264237390173fc0af756497"
		Alamofire.request(urlForUser).responseJSON { (response) in
			
			if let mainDictionary = response.result.value as? [String: AnyObject] {
				let anUser = User(_with: mainDictionary)
				completion(anUser)
				print("Se obtuvieron los datos del usuario \(anUser)")
			}
			
		}
		
	}
	
}

