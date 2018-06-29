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
	
	func getStatsFromAPI(_ photoId: String, completion: @escaping ([Statistics]) -> ()) {
		
		let urlForStats = "https://api.unsplash.com/photos/\(photoId)/statistics&clinet_id=3191679cf58cd03731de7a82e3c2ca92e667448b6c892673787d191a03932068"
		Alamofire.request(urlForStats).responseJSON { (response) in
			
			if let mainDictionary = response.result.value as? [String: AnyObject] {
				if let downloads = mainDictionary["downloads"] as?
					[[String: AnyObject]] {
					var statsArray: [Statistics] = []
					for aDictionary in downloads {
						let newStat = Statistics(with: aDictionary)
						statsArray.append(newStat)
					}
					completion(statsArray)
				} else {
					completion([])
					print("errorr retrieving stats")
				}
			}
			
		}
		
	}
	
}
