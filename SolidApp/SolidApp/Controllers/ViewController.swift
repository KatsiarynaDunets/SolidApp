//
//  ViewController.swift
//  SolidApp
//
//  Created by Kate on 22/11/2023.
//

import UIKit

final class ViewController: BaseViewController {
    // MARK: - Local constants

    /*
     private let countryURL = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
     */

    // MARK: - IBOutlets

    @IBOutlet var emailTF: UITextField!
    @IBOutlet var textLbl: UILabel!
    @IBOutlet var saveButton: UIButton! { didSet { saveButton.isEnabled = false } }

    private let dataFetcherService: DataFetcherServiceProtocol = DataFetcherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataFetcherService.fetchFreeGames() { gamesFree, error in
            print("Free: ", gamesFree?.feed.results[0].artistName)
            print(error)
        }
        dataFetcherService.fetchPaidGames() { gamesPaid, error in
            print("Paid: ", gamesPaid?.feed.results[0].artistName)
            print(error)
        }
        dataFetcherService.fetchCountry() { countries, error in
            print("Country: ", countries?[0].Name)
            print(error)
        }
        
        dataFetcherService.fetchLocalCountry() { countries, error in
            print("Local country: ", countries?[0].Name)
            print(error)
        }
    }
    // MARK: - IBActions

    @IBAction func tfChanged(_ sender: UITextField) {
        if let email = emailTF.text, email.count > 5 {
            textLbl.text = "Cool email"
            saveButton.isEnabled = true
        } else {
            textLbl.text = "Bad email"
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func saveButtonTapped() {
        if let email = emailTF.text, ValidateService.isValidEmail(email: email) {
            DataStoreService.shared.saveEmail(email: email)
        } else {
            showAlert(title: "Error", message: "Bad email")
        }
    }
}
