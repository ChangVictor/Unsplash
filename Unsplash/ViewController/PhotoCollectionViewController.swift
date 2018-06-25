//
//  PhotoCollectionViewController.swift
//  Unsplash
//
//  Created by Victor Chang on 24/06/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	let cellId = "cellId"
	var query: String?
	var photos: [Photo] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		collectionView?.alwaysBounceVertical = true
		collectionView?.backgroundColor = UIColor.rgb(red: 35, green: 35, blue: 35)
		collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: cellId)
		setupNavigationItems()
		
		let service = PhotoService()
		guard let safeQuery = query else { return }
		service.searchByQuery(query: safeQuery, offset: 0) { (photos) in
			self.photos = photos
			self.collectionView?.reloadData()
		}

		
		
		
    }
	
	func setupNavigationItems() {
			navigationItem.title = query
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: 200)
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId	, for: indexPath)
		
		if let photoCell = cell as? PhotoCell {
			photoCell.setupPhoto(photo: photos[indexPath.item])
		}

//		let photoCell = self.photos[indexPath.item]
//		cell.photo = photoCell
		
		
        return cell
    }



}
