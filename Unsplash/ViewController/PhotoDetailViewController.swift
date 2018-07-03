//
//  PhotoDetailViewController.swift
//  Unsplash
//
//  Created by Victor Chang on 27/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class PhotoDetailViewController: UIViewController {

	var photoService: PhotoService?
	var cellDelegate: PhotoCellDelegate?
	
	var photo: Photo?
	var user: User?
	var stats: String = ""
	var statistics: Statistics?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let service = StatsService()
		
		service.getStats(id: stats, completion: {(statistics) in
			self.statistics = (statistics)
			self.likeLabel.text = "likes: \(statistics.totalLikes ?? 0)"
			self.downloadsLabel.text = "downloads: \(statistics.totalDownloads ?? 0)"
			self.viewsLabel.text = "views: \(statistics.totalViews ?? 0)"
			})

		if let user = user {
			detailBioLabel.text = user.bio
		}
		self.detailBioLabel.text = photo?.user?.bio
		self.detailUserNameLabel.text = photo?.user?.username
		if let profileImage = photo?.user?.medium {
			let profileImageUrl = URL(string: profileImage)
			self.detailUserProfileImageView.kf.setImage(with: profileImageUrl)
		}
		if let detailedImage = photo?.regular {
			let detailedUrl = URL(string: detailedImage)
			self.detailPhotoImageView.kf.setImage(with: detailedUrl)
		}
		
		self.view.backgroundColor = UIColor.rgb(red: 35, green: 35, blue: 35)

		//TODO: Separar en funciones y agregar contraints en cada funcion
		view.addSubview(detailUserProfileImageView)
		view.addSubview(detailUserNameLabel)
		view.addSubview(detailPhotoImageView)
		view.addSubview(detailBioLabel)
		setupLayouts()
		setupStackView()
	}
	
	let detailUserProfileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.backgroundColor = .red
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
		label.text = "user bio here"
		label.textColor = .white
		label.numberOfLines = 0
		label.textAlignment = .center
		return label
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
	
	func setupLayouts() {
	
		detailUserProfileImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
		detailUserProfileImageView.layer.cornerRadius = 40 / 2
		
		detailUserNameLabel.anchor(top: detailUserProfileImageView.topAnchor, left: detailUserProfileImageView.rightAnchor, bottom: detailUserProfileImageView.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		
		detailPhotoImageView.anchor(top: detailUserProfileImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		detailPhotoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
		detailPhotoImageView.widthAnchor.constraint(equalTo: detailPhotoImageView.heightAnchor, multiplier: 1).isActive = true
		detailPhotoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		
		detailBioLabel.anchor(top: detailPhotoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 60, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
		detailBioLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
	}
	
	fileprivate func setupStackView() {
		let stackView = UIStackView(arrangedSubviews: [viewsLabel, likeLabel, downloadsLabel])
		stackView.distribution = .equalCentering
		stackView.backgroundColor = .gray
		view.addSubview(stackView)
		stackView.anchor(top: detailPhotoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 50)
	}
}
