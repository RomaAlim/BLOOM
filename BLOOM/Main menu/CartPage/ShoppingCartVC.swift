//
//  ShoppingCartVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 10.04.2023.
//

import UIKit

class ShoppingCartVC: UIViewController {

    @IBOutlet weak var Table: UITableView!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var CostLabel: UILabel!
    @IBOutlet weak var BuyButton: UIButton!
    var isEdited: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Table.register(UINib(nibName: "CartTVCell", bundle: nil), forCellReuseIdentifier: "CartTVCell")
        Table.dataSource = self
        Table.delegate = self
        Table.reloadData()
        BuyButton.layer.cornerRadius = 15
        costSUM = 0
            
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        costSUM = 0
        self.Table.reloadData()
        
    }

    var tableView: UITableView!

    
    @IBAction func BuyButtonAction(_ sender: Any) {
        goToPayCartVC()
    }
    
    func goToPayCartVC() {
         guard let signUpVC = UIStoryboard(name: "Main", bundle: nil)
                 .instantiateViewController(withIdentifier: "PayCartVC") as? PayCartVC else { return }
         navigationController?.pushViewController(signUpVC, animated: true)
     }
    var costSUM = 0
}

extension ShoppingCartVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Base.shared.ListProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < Base.shared.ListProduct.count else { return UITableViewCell() }
        let TableProduct = Base.shared.ListProduct[indexPath.row]
        let cell = Table.dequeueReusableCell(withIdentifier: "CartTVCell", for: indexPath)  as! CartTVCell
        
        cell.ProductBrandCart.text = TableProduct.Brand
        cell.ProductCostCart.text = "\(TableProduct.Cost ) Тг"
        cell.ProductTypeCart.text = TableProduct.TypeProduct
        cell.deleteButton.tag = indexPath.row // Назначьте тег кнопке, чтобы знать, какую строку удалить
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)

        if let imageUrl = URL(string: TableProduct.imageName) {
            let session = URLSession.shared
            let task = session.dataTask(with: imageUrl) { (data, response, error) in
                if let error = error {
                    print("Unable to load image data: \(error)")
                    return
                }
                
                if let imageData = data {
                    DispatchQueue.main.async {
                        cell.ProductImageCart.image = UIImage(data: imageData)
                    }
                }
            }
            task.resume()
        } else {
            cell.ProductImageCart.image = nil
        }

        
//        if let imageUrl = URL(string: TableProduct.imageName) {
//            do {
//                let imageData = try Data(contentsOf: imageUrl)
//                cell.ProductImageCart.image = UIImage(data: imageData)
//            } catch {
//                print("Unable to load image data: \(error)")
//            }
//        } else {
//            cell.ProductImageCart.image = nil
//        }

        if(!isEdited) {
            costSUM += Int(TableProduct.Cost)!
        }

        CostLabel.text = "\(String(costSUM)) Тг"
        return cell
    }
    
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        let indexToDelete = sender.tag
        var products = Base.shared.ListProduct
        let deletedProduct = products[indexToDelete]
        
        products.remove(at: indexToDelete)
        
        costSUM -= Int(deletedProduct.Cost)!
        
        CostLabel.text = "\(String(costSUM)) Тг"

        Base.shared.deleteInCart(id: deletedProduct.id)
        
        isEdited = true
        
        Table.reloadData()
        
    }


}
