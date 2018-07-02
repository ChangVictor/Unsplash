//
//  Statistics.swift
//  Unsplash
//
//  Created by Victor Chang on 26/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation

class Statistics {
	
	var id: String?
	var downloads: String?
	var totalDownloads: Int?
	var views: Int? // Estoy usando la variable??
	var totalViews: Int?
	var likes: Int?
	var totalLikes: Int?
	
	init(_with dictionary: [String: AnyObject]) {
		self.id = dictionary["id"] as? String ?? ""
		if let downloadsDictionary = dictionary["downloads"] as? [String: AnyObject] {
			totalDownloads = downloadsDictionary["total"] as? Int ?? 0
		}
		if let viewsDictionary = dictionary["views"] as? [String: AnyObject] {
			totalViews = viewsDictionary["total"] as? Int ?? 0
		}
		if let likesDictionary = dictionary["likes"] as? [String: AnyObject] {
			totalLikes = likesDictionary["total"] as? Int ?? 0
		}
	}
}
