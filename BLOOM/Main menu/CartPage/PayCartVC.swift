//
//  PayCartVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 27.04.2023.
//

import UIKit


class PayCartVC: UIViewController{

    @IBOutlet weak var CardDetailsView: UIView!
    @IBOutlet weak var BuyOutlet: UIButton!
    @IBOutlet weak var FullNameTF: UITextField!
    @IBOutlet weak var AddressTF: UITextField!
    @IBOutlet weak var PhoneNumberTF: UITextField!
    @IBOutlet weak var Table: UITableView!
    @IBOutlet weak var TotalCost: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BuyOutlet.layer.cornerRadius = 15
        Table.register(UINib(nibName: "CheckoutTVCell", bundle: nil), forCellReuseIdentifier: "CheckoutTVCell")
        Table.dataSource = self
        Table.delegate = self
        Table.reloadData()

        Border(View: CardDetailsView)
        Border(View: Table)
        
        FullNameTF.delegate = self
        AddressTF.delegate = self
        PhoneNumberTF.delegate = self
    }
    func Border(View: UIView) {
        let myView = View
        myView.layer.borderWidth = 1.0 // устанавливаем толщину рамки
        myView.layer.borderColor = UIColor.black.cgColor // устанавливаем цвет рамки
    }
    @IBAction func BuyButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Confirm Purchase", message: "Pay \(totalCost) Тг", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "Pay", style: .default, handler: { action in
            self.addClient()
            self.goToConfirmation()
            UserDefaults.standard.removeObject(forKey: "ListProduct")
        }))

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alertController, animated: true, completion: nil)
        
    }
    
    let url = "https://64455764b80f57f581b7e94f.mockapi.io/api/v1/Clients"
    var StringProduct = ""
 
    func addClient() {
        var dataDict: [String: String] = [:]
        
        if let fullName = FullNameTF.text, !fullName.isEmpty {
            dataDict["fullName"] = fullName
        }
        
        if let address = AddressTF.text, !address.isEmpty {
            dataDict["address"] = address
        }
        
        if let phoneNumber = PhoneNumberTF.text, !phoneNumber.isEmpty {
            dataDict["numberTelephone"] = phoneNumber
        }
        
        if !Base.shared.ListProduct.isEmpty {
            var stringProduct = ""
            
            for product in Base.shared.ListProduct {
                let productString = "\(product.Brand) - \(product.TypeProduct)"
                stringProduct += stringProduct.isEmpty ? productString : ", \(productString)"
            }
            
            dataDict["AddInfo"] = stringProduct
        }
        
        BaseClient.shared.addClient(
            fullName: dataDict["fullName"] ?? "",
            address: dataDict["address"] ?? "",
            numberTelephone: dataDict["numberTelephone"] ?? "",
            addInfo: dataDict["AddInfo"] ?? ""
        )
        
        if !dataDict.isEmpty {
            sendProducts(dataDict)
        }
        
        print(dataDict)
    }
    

    func sendProducts(_ product: [String: Any]) {
        guard let url = URL(string: self.url) else {
            print("Ошибка: некорректный URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: product, options: [])
            request.httpBody = jsonData
        } catch {
            print("Ошибка при сериализации данных: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Ошибка при выполнении запроса: \(error)")
                return
            }
            
            if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                print("Запрос выполнен успешно. Ответ: \(responseString ?? "")")
            }
        }
        
        task.resume()
    }
    
    var totalCost = 0
    func goToConfirmation() {
         guard let signUpVC = UIStoryboard(name: "Main", bundle: nil)
                 .instantiateViewController(withIdentifier: "Confirmation") as? Confirmation else { return }
         navigationController?.pushViewController(signUpVC, animated: true)
     }
    }


extension PayCartVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Base.shared.ListProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < Base.shared.ListProduct.count else { return UITableViewCell() }
        let TableProduct = Base.shared.ListProduct[indexPath.row]
        let cell = Table.dequeueReusableCell(withIdentifier: "CheckoutTVCell", for: indexPath)  as! CheckoutTVCell
        
        cell.BrandLabel.text = TableProduct.Brand
        cell.TypeProductLabel.text = TableProduct.Cost
        cell.CostLabel.text = TableProduct.TypeProduct
        totalCost += Int(TableProduct.Cost)!
        TotalCost.text = "\(totalCost) Тг"
        return cell
    }
    
}
extension PayCartVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
