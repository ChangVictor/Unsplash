//
//  SignUpViewController.swift
//  Unsplash
//
//  Created by Victor Chang on 04/07/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
	
	let plusPhotoButton: UIButton = {
		let button = UIButton(type: .system)
//		button.setImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
		button.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
		return button
	}()
	
	@objc func handlePlusPhoto() {
		// set imagePickerViewCOntroller
	}
	
	let emailTextField: UITextField = {
		let textField = UITextField()
		textField.placeholder = "Email"
		textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
		textField.borderStyle = .roundedRect
		textField.font = UIFont.systemFont(ofSize: 14)
		return textField
	}()
	
	let usernameTextField: UITextField = {
		let textField = UITextField()
		textField.placeholder = "Username"
		textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
		textField.borderStyle = .roundedRect
		textField.font = UIFont.systemFont(ofSize: 14)
		textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
		return textField
	}()
	
	@objc func handleTextInputChange() {
		// settear 
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
