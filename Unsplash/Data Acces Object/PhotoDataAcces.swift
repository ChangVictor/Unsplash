//
//  PhotoDataAcces.swift
//  Unsplash
//
//  Created by Victor Chang on 23/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation
import Alamofire

class PhotoDataAcces {
	
	func getPhotosFromAPIQuery(_ query: String, offset: Int, completion: @escaping ([Photo]) -> Void) {
		
		let url = "https://api.unsplash.com/search/photos?query=\(query)&client_id=3191679cf58cd03731de7a82e3c2ca92e667448b6c892673787d191a03932068"
		Alamofire.request(url).responseJSON { (response) in
			
			if let mainDictionary = response.result.value as? [String: AnyObject] {
				if let results = mainDictionary["results"] as? [[String: AnyObject]] {
					
					var photosArray: [Photo] = []
					for aDictionary in results {
						let newPhoto = Photo(with: aDictionary)
						photosArray.append(newPhoto)
					}
					completion(photosArray)
				} else {
					completion([])
					print("Error retrieving data")
				}
			}
			
		}
		
		
	}
	
}
