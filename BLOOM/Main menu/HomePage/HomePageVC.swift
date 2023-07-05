//
//  HomePageVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 15.04.2023.
//

import UIKit
import Alamofire
import Foundation

class HomePageVC: UIViewController{
    
    @IBOutlet weak var SearchBarHome: UISearchBar!
    @IBOutlet weak var Table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.dataSource = self
        Table.delegate = self
        Table.register(UINib(nibName: "HomeTVCell", bundle: nil), forCellReuseIdentifier: "HomeTVCell")
        
        
                let network = NetworkAL() // Alamifire
                network.DecoderAL { responseData in // Alamifire
                    for product in responseData { // Alamifire
                        self.ProductList.append(product) // Alamifire
                    } // Alamifire
                    self.Table.reloadData() // Reload table data to display the new products // Alamifire
                } // Alamifire
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.Table.reloadData()
        
    }

    var position = 0
    var ProductList:[ProductFull] = []
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? ProductInfoVC else {return}
        
        // ProductList.append()
        if segue.identifier == "InfoVCSegue" {
            detailVC.DescriptionLabel = ProductList[position].Description
            detailVC.СompositionLabel = ProductList[position].Сomposition
            detailVC.ApplicationLabel = ProductList[position].Application
            detailVC.AddInfoLabel = ProductList[position].AddInfo
            detailVC.ImageHome = ProductList[position].imageName
            detailVC.CostHome = ProductList[position].Cost
            detailVC.TypeProductHome = ProductList[position].TypeProduct
            detailVC.BrandHome = ProductList[position].Brand
            detailVC.idPro = ProductList[position].id
            // detailVC.ListProduct = ProductList[position]
            
        }
        
    }
    
    }


extension HomePageVC:UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableProduct = ProductList[indexPath.row]
        let cell = Table.dequeueReusableCell(withIdentifier: "HomeTVCell", for: indexPath) as! HomeTVCell
        cell.ProductBrand.text = TableProduct.Brand
        cell.ProductCost.text = TableProduct.Cost
        cell.ProductType.text = TableProduct.TypeProduct
        cell.ProductImage.image = nil // установите изображение в nil, чтобы избежать отображения неправильного изображения, если ячейка повторно используется
        if let imageURL = TableProduct.imageURL {
            TableProduct.loadImage(from: imageURL) { image in
                DispatchQueue.main.async {
                    cell.ProductImage.image = image
                }
            }
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        position = indexPath.row
        performSegue(withIdentifier: "InfoVCSegue", sender: self)
    }
}


