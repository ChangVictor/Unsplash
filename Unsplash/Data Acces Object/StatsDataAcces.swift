//
//  StatsDataAcces.swift
//  Unsplash
//
//  Created by Victor Chang on 26/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation
import Alamofire

class StatsDataAcces {
	
	func getStatsFromAPI(_ photoId: String, completion: @escaping (Statistics) -> ()) {
	
		let urlForStats = "https://api.unsplash.com/photos/\(photoId)/statistics?client_id=090e1bedb6a26dec7b7b0c339fc0b8b70218f9a43264237390173fc0af756497"
		Alamofire.request(urlForStats).responseJSON { (response) in
			
			if let mainDictionary = response.result.value as? [String: AnyObject] {
				let theStat = Statistics(_with: mainDictionary)
				completion(theStat)
				
				print("Se han obtenido los stats de \(theStat)")
			}
			
		}
	}
}
