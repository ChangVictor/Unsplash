//
//  PhotoService.swift
//  Unsplash
//
//  Created by Victor Chang on 23/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation

class PhotoService {
	
	
	func searchByQuery(query: String, offset: Int, completion: @escaping ([Photo]) -> ()) {
		
		let photoDataAcces = PhotoDataAcces()
		
		photoDataAcces.getPhotosFromAPIQuery(query, offset: offset) { (response) in
			
		}
		
	}
	
	
}
