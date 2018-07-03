//
//  User.swift
//  Unsplash
//
//  Created by Victor Chang on 23/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation

class User {
	
	var id: String?
	var username: String?
	var name: String?
	var first_name: String?
	var last_name: String?
	var followers_count: Int?
	var following_count: Int?
	var total_photos: Int?
	var bio: String?
	var downloads: Int?
	var profile_image: String?
	var small: String?
	var medium: String?
	var large: String?
	var likes: Int?
	
	init(_with dictionary: [String: AnyObject]) {
		self.id = dictionary["id"] as? String ?? "no id set"
		self.username = dictionary["username"] as? String ?? "no username"
		self.name = dictionary["name"] as? String ?? "no name"
		self.first_name = dictionary["first_name"] as? String ?? "no first name"
		self.last_name = dictionary["last_name"] as? String ?? "no last name"
		self.followers_count = dictionary["followers_count"] as? Int ?? 0
		self.following_count = dictionary["following_count"] as? Int ?? 0
		self.total_photos = dictionary["total_photos"] as? Int ?? 0
		self.downloads = dictionary["downloads"] as? Int ?? 00
		self.bio = dictionary["bio"] as? String ?? ""
		self.likes = dictionary["total_likes"] as? Int? ?? 0
		// de donde pido el profile image?
		if let profileInfo = dictionary["profile_image"] as? [String:AnyObject] {
			self.small = profileInfo["small"] as? String
			self.medium = profileInfo["medium"] as? String ?? ""
			self.large = profileInfo["large"] as? String
		}
	}
}
