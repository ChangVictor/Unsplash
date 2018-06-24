//
//  Photo.swift
//  Unsplash
//
//  Created by Victor Chang on 23/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation

class Photo {
	
	private var id: String?
	private var created_at: Date?
	private var updated_at: Date?
	private var width: Int?
	private var height: Int?
	private var description: String?
	private var urls: String?
	private var user: String?
	private var links: String?
	private var profile_image: String?
	private var instagram_username: String?
	private var total_likes: Int?
	private var total_photos: Int?
	
	init(with dictionary: [String: AnyObject]) {
		self.id = dictionary["id"] as? String ?? "no id set"
		self.created_at = dictionary["created_at"] as? Date
		self.updated_at = dictionary["updated_at"] as? Date
		self.width = dictionary["width"] as? Int
		self.height = dictionary["height"] as? Int
		self.description = dictionary["description"] as? String ?? "No description"
		self.urls = dictionary["urls"] as? String
		self.user = dictionary["user"] as? String
		self.links = dictionary["links"] as? String
		self.profile_image = dictionary["profile_image"] as? String
		self.instagram_username = dictionary["instagram_username"] as? String
		self.total_likes = dictionary["total_likes"] as? Int
		self.total_photos = dictionary["total_photos"] as? Int
	}
}
