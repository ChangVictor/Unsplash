//
//  PhotoCell.swift
//  Unsplash
//
//  Created by Victor Chang on 24/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit
import Kingfisher

protocol PhotoCellDelegate {
	func didTapProfile(profile: UIButton)
	func didTapPhoto(image: UIImageView)
}

class PhotoCell: UICollectionViewCell {
	
	var cellDelegate: PhotoCellDelegate?
	
	var photo: Photo? {
		didSet {
//			if let photoUrl = photo?.thumb {
//				let url = URL(string: photoUrl)
//			}
//			guard let photoImageUrl = photo?.thumb else { return }
//			photoImageView.loadImage(urlString: photoImageUrl)
//			print("test")
			
//			userNameLabel.text = photo?.user?.username
//			userNameLabel.text = "userName"
//			userNameLabel.text = photo?.user?.username
		}
	}
	
	func setupData(photo: Photo?, delegate: PhotoCellDelegate) {

		if let photImageUrl = photo?.regular {
			let url = URL(string: photImageUrl)
			photoImageView.kf.setImage(with: url)
		} else {
			photoImageView.image = nil
		}
	
		if let profileImageUrl = photo?.user?.medium{
			let urlProfilePic = URL(string: profileImageUrl)
			userProfileImageView.kf.setImage(with: urlProfilePic)
		}
		userNameLabel.setTitle("\(photo?.user?.username ?? "userName")", for: .normal)
		cellDelegate = delegate
		
	}

	let userProfileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}()

	let userNameLabel: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("username", for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		button.contentHorizontalAlignment = .left
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(profilePress), for: .touchUpInside)
		return button
	}()
	
//	let userNameLabel: UILabel = {
//		let label = UILabel()
//		label.text = "username"
//		label.font = UIFont.boldSystemFont(ofSize: 16)
//		label.textColor = .white
//		let tap = UITapGestureRecognizer(target: self, action: #selector(profileNameTapped))
//		label.isUserInteractionEnabled = true
//		label.addGestureRecognizer(tap)
//
//		return label
//	}()
	
	let photoImageView: UIImageView = {
		let imageView = UIImageView() //CustomImageView
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.isUserInteractionEnabled = true
		return imageView
	}()
	
	let likeLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 13)
		label.textColor = UIColor.rgb(red: 230, green: 230, blue: 230)
		label.text = "likes: "
		
		return label
	}()
	
	let downloadsLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 13)
		label.text = "downloads: "
		label.textColor = UIColor.rgb(red: 230, green: 230, blue: 230)
		return label
	}()
	
	let viewsLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 13)
		label.text = "views: "
		label.textColor = UIColor.rgb(red: 230, green: 230, blue: 230)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(photoImageView)
		addSubview(userProfileImageView)
		addSubview(userNameLabel)
		
		userProfileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
		userProfileImageView.layer.cornerRadius = 40 / 2 // 40 porque el width y heigth son 40
		
		userNameLabel.anchor(top: topAnchor, left: userProfileImageView.rightAnchor, bottom: photoImageView.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		photoImageView.anchor(top: userProfileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		photoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true // le doy un anchor "especial para que no tome los 60 de la description"
		
		
		userNameLabel.addTarget(self, action: #selector(profilePress), for: .touchUpInside)
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(imageDetailTapped))
		photoImageView.addGestureRecognizer(tap)
		
		setupStackView()
		//profileNameTapped()
	}
	
	fileprivate func setupStackView() {
		let stackView = UIStackView(arrangedSubviews: [viewsLabel, likeLabel, downloadsLabel])
		stackView.distribution = .fillEqually
		stackView.backgroundColor = .gray
		addSubview(stackView)
		stackView.anchor(top: photoImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
		}
	@objc func profilePress() {
		cellDelegate?.didTapProfile(profile: userNameLabel)
		print("profile tapped")
	}
	
	@objc func imageDetailTapped() {
		cellDelegate?.didTapPhoto(image: photoImageView)
		print("imageTapped")
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

