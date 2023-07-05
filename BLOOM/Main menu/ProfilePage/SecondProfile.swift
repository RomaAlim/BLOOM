//
//  SecondProfile.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 15.04.2023.
//

import UIKit

class SecondProfile: UIViewController {

    @IBOutlet weak var SuccessLabel: UIButton!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addInfoLabel: UITextView!
    
    var segueFullName = ""
    var segueAddress = ""
    var seguePhoneNumber = ""
    var segueAddinfo = ""
    var segueId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SuccessLabel.layer.cornerRadius = 15
        fullNameLabel.text = segueFullName
        AddressLabel.text = segueAddress
        phoneNumberLabel.text = seguePhoneNumber
        addInfoLabel.text = segueAddinfo
    }
    

    @IBAction func SuccessButton(_ sender: Any) {
        deleteClient()
    }

    private func showConfirmationAlert() {
           let alert = UIAlertController(title: "Подтверждение", message: "Вы точно получили заказ?", preferredStyle: .alert)
           
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           let successAction = UIAlertAction(title: "Success", style: .default) { [weak self] (_) in
               self?.deleteClient()
           }
           
           alert.addAction(cancelAction)
           alert.addAction(successAction)
           
           present(alert, animated: true, completion: nil)
       }
       
       private func deleteClient() {
           if let id = Int(segueId) {
               BaseClient.shared.deleteClient(id: id)
           }
           self.goToThanks()
       }
    func goToThanks() {
         guard let signUpVC = UIStoryboard(name: "Main", bundle: nil)
                 .instantiateViewController(withIdentifier: "ThanksVC") as? ThanksVC else { return }
         navigationController?.pushViewController(signUpVC, animated: true)
     }

}
