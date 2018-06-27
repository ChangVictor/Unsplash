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
	var created_at: String?
	var updated_at: String?
	var width: Int?
	var height: Int?
	var description: String?
	var urls: String?
	var raw: String?
	var full: String?
	var regular: String?
	var small: String?
	var thumb: String?
	var likes: Int?
	var user: User?
	var profile_small: String?
	var instagram_username: String?
	var total_photos: Int?
	
	init(with dictionary: [String: AnyObject]) {
		self.id = dictionary["id"] as? String ?? "no id set"
		self.created_at = dictionary["created_at"] as? String
		self.updated_at = dictionary["updated_at"] as? String
		self.width = dictionary["width"] as? Int ?? 0
		self.height = dictionary["height"] as? Int ?? 0
		self.description = dictionary["description"] as? String ?? "No description"
		
		if let urlDictionary = dictionary["urls"] as? [String: AnyObject] {
			self.raw = urlDictionary["raw"] as? String
			self.full = urlDictionary["full"] as? String
			self.regular = urlDictionary["regular"] as? String
			self.small = urlDictionary["small"] as? String
			self.thumb = urlDictionary["thumb"] as? String
		}
		if let dictUser = dictionary["user"] as? [String: AnyObject]{
			self.user = User(_with: dictUser)
			self.small = dictUser["small"] as? String ?? ""
		}
		self.instagram_username = dictionary["instagram_username"] as? String
		self.likes = dictionary["likes"] as? Int ?? 0
		self.total_photos = dictionary["total_photos"] as? Int ?? 0
		
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
