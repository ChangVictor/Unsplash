//
//  Photo.swift
//  Unsplash
//
//  Created by Victor Chang on 23/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation

class Photo {
	
	var id: String?
	var created_at: Date?
	var updated_at: Date?
	var width: Int?
	var height: Int?
	var description: String?
	var urls: String?
	var raw: String?
	var full: String?
	var regular: String?
	var small: String?
	var thumb: String?
	var user: String?
	var links: String?
	var profile_image: String?
	var instagram_username: String?
	var total_likes: Int?
	var total_photos: Int?
	
	init(with dictionary: [String: AnyObject]) {
		self.id = dictionary["id"] as? String ?? "no id set"
		self.created_at = dictionary["created_at"] as? Date
		self.updated_at = dictionary["updated_at"] as? Date
		self.width = dictionary["width"] as? Int
		self.height = dictionary["height"] as? Int
		self.description = dictionary["description"] as? String ?? "No description"
//		self.urls = dictionary["urls"] as? String
		guard self.urls == dictionary["urls"] as? String,
			self.raw == dictionary["raw"] as? String,
			self.full == dictionary["full"] as? String,
			self.regular == dictionary["regular"] as? String,
			self.small == dictionary["small"] as? String,
			self.thumb == dictionary["thumb"] as? String
			else { return }
	
		self.user = dictionary["user"] as? String
		self.links = dictionary["links"] as? String
		self.profile_image = dictionary["profile_image"] as? String
		self.instagram_username = dictionary["instagram_username"] as? String
		self.total_likes = dictionary["total_likes"] as? Int
		self.total_photos = dictionary["total_photos"] as? Int
	}
}

//class imageUrl {
//
//	private var raw: String?
//	private var full: String?
//	private var regular: String?
//	private var small: String?
//	private var thumb: String?
//
//}
