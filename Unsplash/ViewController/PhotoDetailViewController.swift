//
//  PhotoDetailViewController.swift
//  Unsplash
//
//  Created by Victor Chang on 27/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

	var photoService: PhotoService?
	var cellDelegate: PhotoCellDelegate?
	var photo: Photo?
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.backgroundColor = UIColor.rgb(red: 35, green: 35, blue: 35)

		//TODO: Separar en funciones y agregar contraints en cada funcion
		detailPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(detailUserNameLabel)
		view.addSubview(detailPhotoImageView)
		view.addSubview(detailBioLabel)
		view.addSubview(detailBioLabel)
		detailPhotoImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
	}
	
	let detailUserProfileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}()
	
	let detailUserNameLabel: UILabel = {
		let label = UILabel()
		label.text = "username"
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = .white
		label.isUserInteractionEnabled = true
//		let tap = UITapGestureRecognizer(target: self, action: #selector(profileNameTapped))
//		label.addGestureRecognizer(tap)
		return label
		}()
	
	let detailPhotoImageView: UIImageView = {
		let imageView = UIImageView() //CustomImageView
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.isUserInteractionEnabled = true
		imageView.backgroundColor = .gray
		return imageView
	}()
	
	let detailBioLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		return label
	}()

	func setupData(photo: Photo?, delegate: PhotoCellDelegate) {
//		if let photImageUrl = photo?.regular {
//			let url = URL(string: photImageUrl)
//			photoImageView.kf.setImage(with: url)
//		} else {
//			photoImageView.image = nil
//		}
		if let profileImageUrl = photo?.user?.medium{
			let urlProfilePic = URL(string: profileImageUrl)
			detailUserProfileImageView.kf.setImage(with: urlProfilePic)
		}
		detailUserNameLabel.text = photo?.user?.username ?? "userName"
		cellDelegate = delegate
	}

}
