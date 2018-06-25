//
//  PhotoCell.swift
//  Unsplash
//
//  Created by Victor Chang on 24/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {
	
	var photo: Photo? {
		didSet {
//			if let photoUrl = photo?.thumb {
//				let url = URL(string: photoUrl)
//			}
//			guard let photoImageUrl = photo?.thumb else { return }
//			photoImageView.loadImage(urlString: photoImageUrl)
//			print("test")
		}
	}
	
	func setupPhoto(photo: Photo) {
		if let photImageUrl = photo.thumb {
			let url = URL(string: photImageUrl)
			photoImageView.kf.setImage(with: url)
		} else {
			photoImageView.image = nil
		}
	}
	
	let photoImageView: UIImageView = {
		let imageView = UIImageView() //CustomImageView
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(photoImageView)
		photoImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//		setupPhoto(photo: photo)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
