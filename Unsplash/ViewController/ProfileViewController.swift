//
//  ProfileViewController.swift
//  Unsplash
//
//  Created by Victor Chang on 27/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ProfileViewController: UIViewController {

	var userData: String = ""
	var user: User?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor.rgb(red: 35, green: 35, blue: 35)
		view.addSubview(profileImageView)
		view.addSubview(profileUsernameLabel)
		view.addSubview(profileNameLabel)
		view.addSubview(friendsLabel)
		view.addSubview(followersLabel)
		view.addSubview(favoritesLabel)
		view.addSubview(photosLabel)
		profileUsernameLabel.text = userData
		setupViews()
		setupStackView()
		setupProfileData()
	}

	let profileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.backgroundColor = .gray
		return imageView
	}()
	
	var profileUsernameLabel: UILabel = {
		let label = UILabel()
		label.text = "username"
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor = .white
		label.isUserInteractionEnabled = true
		label.textAlignment = .center
		return label
	}()
	let profileNameLabel: UILabel = {
		let label = UILabel()
		label.text = "name & surname"
		label.font = UIFont.systemFont(ofSize: 14)
		label.textColor = .white
		label.isUserInteractionEnabled = true
		label.textAlignment = .center
		return label
	}()
	
	let friendsLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 13)
		label.textColor = UIColor.rgb(red: 230, green: 230, blue: 230)
		label.text = "Friends: 514"
		
		return label
	}()
	
	let followersLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 13)
		label.text = "Followers: 524"
		label.textColor = UIColor.rgb(red: 230, green: 230, blue: 230)
		return label
	}()
	
	let favoritesLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 13)
		label.text = "Favorites: 0"
		label.textColor = UIColor.rgb(red: 230, green: 230, blue: 230)
		return label
	}()
	
	let photosLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 13)
		label.text = "Photos: 522"
		label.textColor = UIColor.rgb(red: 230, green: 230, blue: 230)
		return label
	}()
	
	func setupViews() {
		
		profileImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		profileImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
		profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor, multiplier: 1).isActive = true
		profileImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		
		profileUsernameLabel.anchor(top: profileImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
		profileNameLabel.anchor(top: profileUsernameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 0)
		profileUsernameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		profileNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		friendsLabel.anchor(top: nil, left: nil, bottom: followersLabel.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 25)
		followersLabel.anchor(top: nil, left: nil, bottom: favoritesLabel.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 25)
		favoritesLabel.anchor(top: nil, left: nil, bottom: photosLabel.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 25)
		photosLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 25)
	}
	
	fileprivate func setupStackView() {
		let stackView = UIStackView(arrangedSubviews: [friendsLabel, followersLabel, favoritesLabel, photosLabel])
//		stackView.distribution = .fillEqually
		stackView.axis = .vertical
		stackView.distribution = .equalSpacing
//		stackView.spacing = 8
		stackView.backgroundColor = .red
		view.addSubview(stackView)

		stackView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true
	}
	
	func setupProfileData() {

		let userService = UserService()
		
		userService.getUser(username: userData, completion: { (userInfo) in
			self.user = (userInfo)
			self.profileUsernameLabel.text = userInfo.username
			self.profileNameLabel.text = userInfo.name
			self.followersLabel.text = "Followers: \(userInfo.followers_count ?? 0)"
			self.friendsLabel.text = "Following: \(userInfo.following_count ?? 0)"
			self.favoritesLabel.text = "Favorites: \(userInfo.likes ?? 0)"
			self.photosLabel.text = "Photos: \(userInfo.total_photos ?? 0)"
			
			if let profileImage = userInfo.large {
				let profileImageUrl = URL(string: profileImage)
			self.profileImageView.kf.setImage(with: profileImageUrl)
			}
		})
	}
	func setupNavigationItems() {
		
	}
	
	
	
}
