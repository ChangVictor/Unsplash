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
	func didTapPhoto(photo: Photo)
}

class PhotoCell: UICollectionViewCell {
	
	var delegate: PhotoCellDelegate?
	
	var photo: Photo? {
		didSet {
//			if let photoUrl = photo?.thumb {
//				let url = URL(string: photoUrl)
//			}
//			guard let photoImageUrl = photo?.thumb else { return }
//			photoImageView.loadImage(urlString: photoImageUrl)
//			print("test")
			
//			userNameLabel.text = photo?.user?.username
		}
	}
	
	func setupPhoto(photo: Photo) {
		if let photImageUrl = photo.regular {
			let url = URL(string: photImageUrl)
			photoImageView.kf.setImage(with: url)
		} else {
			photoImageView.image = nil
		}
		
//		if let profileImageUrl = photo.user?.profile_image {
//			let url = URL(string: profileImageUrl)
//		}
//
//		userNameLabel.text = photo.user?.username
//
		
	}

	let userProfileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}()
	
	let userNameLabel: UILabel = {
		let label = UILabel()
		label.text = "username"
		label.font = UIFont.boldSystemFont(ofSize: 14)
		return label
	}()
	
	let photoImageView: UIImageView = {
		let imageView = UIImageView() //CustomImageView
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}()
	
	let descriptionLabe: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(photoImageView)
		addSubview(userProfileImageView)
		addSubview(userNameLabel)
		addSubview(descriptionLabe)
		
		userProfileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
		userProfileImageView.layer.cornerRadius = 40 / 2
		
		userNameLabel.anchor(top: topAnchor, left: userProfileImageView.rightAnchor, bottom: photoImageView.topAnchor, right: leftAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		photoImageView.anchor(top: userProfileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		photoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
