//
//  ProfileVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 10.04.2023.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var Table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.dataSource = self
        Table.delegate = self
        Table.register(UINib(nibName: "ProfileTVCell", bundle: nil), forCellReuseIdentifier: "ProfileTVCell")
        // Do any additional setup after loading the view.
        Table.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Table.reloadData()
    }
    var position = 0

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? SecondProfile else {return}

        if segue.identifier == "goToSecond" {
            if let indexPath = Table.indexPathForSelectedRow {
                let client = BaseClient.shared.clientList[indexPath.row]
                detailVC.segueId = String(client.id)
                detailVC.segueAddinfo = client.addInfo
                detailVC.segueAddress = client.address
                detailVC.segueFullName = client.fullName
                detailVC.seguePhoneNumber = client.numberTelephone
            }
        }
        if let value = UserDefaults.standard.object(forKey: "ClientList") {
            // Значение существует в UserDefaults
            print("Значение в UserDefaults: \(value)")
        } else {
            // Значение не найдено или равно nil
            print("Значение не найдено или nil")
        }

    }
} // ProfileTVCell goToSecond
extension ProfileVC:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BaseClient.shared.clientList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < BaseClient.shared.clientList.count else { return UITableViewCell() }
        let TableProduct = BaseClient.shared.clientList[indexPath.row]
        let cell = Table.dequeueReusableCell(withIdentifier: "ProfileTVCell", for: indexPath)  as! ProfileTVCell
        
        cell.TypeProduct.text = String(TableProduct.id)
        cell.CostProduct.text = TableProduct.addInfo

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        position = indexPath.row
        performSegue(withIdentifier: "goToSecond", sender: self)
    }
    
}
