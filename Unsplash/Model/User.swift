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
	var twitter_username: String?
	var portfolio_url: String?
	var bio: String?
	var profile_image: String?
	var small: String?
	var medium: String?
	var large: String?
	var links: String?
	
	init(_with dictionary: [String: AnyObject]) {
		self.id = dictionary["id"] as? String ?? "no id set"
		self.username = dictionary["username"] as? String ?? "no username"
		self.name = dictionary["name"] as? String ?? "no name"
		self.first_name = dictionary["first_name"] as? String ?? "no first name"
		self.last_name = dictionary["last_name"] as? String ?? "no last name"
		self.twitter_username = dictionary["twitter_username"] as? String ?? ""
		self.portfolio_url = dictionary["portfolio_url"] as? String ?? ""
		self.bio = dictionary["bio"] as? String ?? ""
		if let profileInfo = dictionary["profile_image"] as? [String:AnyObject] {
			self.small = profileInfo["small"] as? String
			self.medium = profileInfo["medium"] as? String
			self.large = profileInfo["large"] as? String
		}
	}
}
