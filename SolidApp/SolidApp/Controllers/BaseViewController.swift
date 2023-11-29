//
//  BaseViewController.swift
//  SolidApp
//
//  Created by Kate on 22/11/2023.
//

import UIKit

class BaseViewController: UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

