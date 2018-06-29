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
	
	func getUserProfileFromAPI(_ username: String, completion: ([User]) -> ()) {
		
		let urlForStats = "https://api.unsplash.com/users/\(username)/statistics&clinet_id=3191679cf58cd03731de7a82e3c2ca92e667448b6c892673787d191a03932068"
		Alamofire.request(urlForStats).responseJSON { (response) in
			
			if let mainDictionary = response.result.value as? [String: AnyObject] {
				
			}
			
		}
		
	}
	
}

