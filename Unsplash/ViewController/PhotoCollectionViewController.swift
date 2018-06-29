//
//  PhotoCollectionViewController.swift
//  Unsplash
//
//  Created by Victor Chang on 24/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, PhotoCellDelegate {
	func didTapPhoto(image: UIImageView) {
		let photoDetailViewController = PhotoDetailViewController()
//		navigationController?.present(photoDetailViewController, animated: true)
		navigationController?.pushViewController(photoDetailViewController, animated: true)
		setupBackButton()
	}
	
	func didTapProfile(profile: UIButton) {
		print("tap Profile")
		let profileViewController = ProfileViewController()
		navigationController?.pushViewController(profileViewController, animated: true)
		
		setupBackButton()
		}
	
	let cellId = "cellId"
	var query: String?
	var photo: Photo?
	var photos: [Photo] = []
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		collectionView?.alwaysBounceVertical = true
		collectionView?.backgroundColor = UIColor.rgb(red: 35, green: 35, blue: 35)
		collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: cellId)
		setupNavigationItems()

		let service = PhotoService()
		guard let safeQuery = query else { return }
		service.searchByQuery(query: safeQuery, page: 0) { (photos) in
			self.photos = photos
			self.collectionView?.reloadData()
		}
    }
	
	func setupNavigationItems() {
		self.navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
		navigationItem.title = query
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		var height: CGFloat = 40 + 8 + 8 //username userprofileimageview
		height += view.frame.width
		height += 50 // para los stats
		return CGSize(width: view.frame.width, height: height)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		if self.isMovingFromParentViewController {
			navigationController?.navigationBar.prefersLargeTitles = false
		}
	}
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId	, for: indexPath)
		
		if let photoCell = cell as? PhotoCell {
			photoCell.setupData(photo: photos[indexPath.item], delegate: self)
		}
		
		if indexPath.item == photos.count - 2{
			loadNextPage()
		}
		
        return cell
    }
	// Esto va aca?
	private func loadNextPage() {
		let service = PhotoService()
		service.searchByQuery(query: query!, page: photos.count) { (photos) in
			self.photos.append(contentsOf: photos)
			self.collectionView?.reloadData()
		}
	}

	fileprivate func setupBackButton() {
		let backItem = UIBarButtonItem()
		backItem.title = ""
		navigationItem.backBarButtonItem = backItem
		navigationItem.backBarButtonItem?.tintColor = .white
	}

}
