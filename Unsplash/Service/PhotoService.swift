//
//  PhotoService.swift
//  Unsplash
//
//  Created by Victor Chang on 23/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation

class PhotoService {
	
	
	func searchByQuery(query: String, page: Int, completion: @escaping ([Photo]) -> ()) {
		
		let photoDataAcces = PhotoDataAcces()
		
		photoDataAcces.getPhotosFromAPIQuery(query, page: page) { (response) in
			print("Data Acces termino de obtener las fotos")
			completion(response)
		}
		
	}
	
}
