//
//  StatsService.swift
//  Unsplash
//
//  Created by Victor Chang on 01/07/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation
import Alamofire

class StatsService {
	
	func getStats(id: String, completion: @escaping ((Statistics) -> ())) {
		let statSataAcces = StatsDataAcces()
		
		statSataAcces.getStatsFromAPI(id) { (response) in
			completion(response)
		}
	}
}
