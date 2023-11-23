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

    private let dataStoreService = DataStoreService.shared
    private let dataFetcherService: DataFetcherServiceProtocol = DataFetcherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataFetcherService.
        
//        networkDataFetcher.fetchFreeGames(pathURL: Constants.urlFreeGames) { gamesFree, error in
//            print("Free: ", gamesFree?.feed.results[0].artistName)
//            print(error)
//        }
//        networkDataFetcher.fetchPaidGames(pathURL: Constants.urlPaidGames) { gamesPaid, error in
//            print("Paid: ", gamesPaid?.feed.results[0].artistName)
//            print(error)
//        }
//        networkDataFetcher.fetchCountry(pathURL: Constants.countryURL) { countries, error in
//            print("Country: ", countries?[0].Name)
//            print(error)
//        }
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
//            let alert = UIAlertController(title: "Error", message: "Bad email", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//            present(alert, animated: true)
        }
    }

    // MARK: - Network

    /*
     private func dataTetcher(pathURL: String) {
         guard let url = URL(string: pathURL) else { return }
         let request = URLRequest(url: url)
         let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
             DispatchQueue.main.async {
                 let decoder = JSONDecoder()
                 guard let self, let data else { return }
                 let countries = try? decoder.decode([Country].self, from: data)
                 print(countries ?? "")
                 self.textLbl.text = countries?[0].Name
             }
         }
         task.resume()
     }
     */
    /*
     private func dataTetcher(pathURL: String) {
         request(pathURL: pathURL) { [weak self] data, _ in
             let decoder = JSONDecoder()
             guard let self, let data else { return }
             let countries = try? decoder.decode([Country].self, from: data)
             print(countries ?? "")
             self.textLbl.text = countries?[0].Name
         }
     }

     private func request(pathURL: String, comletion: @escaping (Data?, Error?) -> Void) {
         guard let url = URL(string: pathURL) else { return }
         let request = URLRequest(url: url)
         let task = URLSession.shared.dataTask(with: request) { data, _, error in
             DispatchQueue.main.async {
                 comletion(data, error)
             }
         }
         task.resume()
     }
     */

    // MARK: - валидация Email

    /*
     private func isValidEmail(email: String) -> Bool {
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
         return emailPred.evaluate(with: email)
     }
     */

    // MARK: - работа с БД

    /*
     private func saveEmail(email: String) {
         print("Your email: \(email) is saved")
     }

     private func getEmail() -> String {
         "Your email"
     }
     */

    // MARK: - Models

    /*
     struct Country: Decodable {
         let Id: String
         let Time: String
         let Name: String
         let Image: String?
     }
      */
}
