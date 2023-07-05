//
//  ClientVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 29.04.2023.
//

import UIKit
import Alamofire

class ClientVC: UIViewController {

    @IBOutlet weak var Table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Table.reloadData()
        let network = NetworkAdminAL() // Alamifire
        network.DecoderAL { responseData in // Alamifire
            for product in responseData { // Alamifire
                self.ListClient.append(product) // Alamifire
            } // Alamifire
            self.Table.reloadData() // Reload table data to display the new products // Alamifire
        } // Alamifire
        
        Table.dataSource = self
        Table.delegate = self
        Table.register(UINib(nibName: "ClientTVCell", bundle: nil), forCellReuseIdentifier: "ClientTVCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.Table.reloadData()
        
    }
    
    var position = 0
    var ListClient:[ClientList] = []

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? ClientInfoVC else {return}

        if segue.identifier == "goToClient" {
            detailVC.segueFullName = ListClient[position].fullName
            detailVC.segueAddress = ListClient[position].address
            detailVC.seguePhoneNumber = ListClient[position].numberTelephone
            detailVC.segueAddinfo = ListClient[position].AddInfo
            detailVC.segueId = ListClient[position].id
            
        }
        
    }

}
extension ClientVC:UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ListClient.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableProduct = ListClient[indexPath.row]
        let cell = Table.dequeueReusableCell(withIdentifier: "ClientTVCell", for: indexPath) as! ClientTVCell
        cell.FullNameCell.text = TableProduct.fullName
        cell.idCell.text = TableProduct.id

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        position = indexPath.row
        performSegue(withIdentifier: "goToClient", sender: self)
    }
}
