//
//  ProductInfoVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 15.04.2023.
//

import UIKit

class ProductInfoVC: UIViewController {

    
    @IBOutlet weak var TextFill: UITextView!
    @IBOutlet weak var Description: UIButton!
    @IBOutlet weak var AddInfo: UIButton!
    @IBOutlet weak var Application: UIButton!
    @IBOutlet weak var Сomposition: UIButton!
    
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var CostLabel: UILabel!
    @IBOutlet weak var TypeProductLabel: UILabel!
    @IBOutlet weak var BrandLabel: UILabel!
    
    var DescriptionLabel = ""
    var СompositionLabel = ""
    var ApplicationLabel = ""
    var AddInfoLabel = ""
    
    var ImageHome = ""
    var CostHome = ""
    var TypeProductHome = ""
    var BrandHome = ""
    var idPro = ""
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Description.layer.cornerRadius = 10
        AddInfo.layer.cornerRadius = 10
        Application.layer.cornerRadius = 10
        Сomposition.layer.cornerRadius = 10
        
       //ProductImage.image = ImageHome
        CostLabel.text = CostHome
        TypeProductLabel.text = TypeProductHome
        BrandLabel.text = BrandHome
        TextFill.text = DescriptionLabel
        
        if let url = URL(string: ImageHome) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.ProductImage.image = image
                    }
                }
            }.resume()
        }


    }
    
    @IBAction func DescriptionButton(_ sender: UIButton) {
        TextFill.text = DescriptionLabel
        Description.alpha = 1.0
        Сomposition.alpha = 0.5
        Application.alpha = 0.5
        AddInfo.alpha = 0.5
    }
    
    @IBAction func СompositionButton(_ sender: UIButton) {
        TextFill.text = СompositionLabel
        Description.alpha = 0.5
        Сomposition.alpha = 1.0
        Application.alpha = 0.5
        AddInfo.alpha = 0.5
    }
    
    @IBAction func ApplicationButton(_ sender: UIButton) {
        TextFill.text = ApplicationLabel
        Description.alpha = 0.5
        Сomposition.alpha = 0.5
        Application.alpha = 1.0
        AddInfo.alpha = 0.5
    }
    
    @IBAction func AddInfoButton(_ sender: UIButton) {
        TextFill.text = AddInfoLabel
        Description.alpha = 0.5
        Сomposition.alpha = 0.5
        Application.alpha = 0.5
        AddInfo.alpha = 1.0
    }
    
    
    @IBAction func AddToCart(_ sender: UIButton) {
        let image = ImageHome
        let brand = BrandHome
        let typeProduct = TypeProductHome
        let cost = CostHome
        
        if !brand.isEmpty && !typeProduct.isEmpty && !cost.isEmpty{
            Base.shared.addToCart(brand: brand, typeProduct: typeProduct, cost: cost, imageName: image)
            alert()
        }
        
        func alert(){
            let alertController = UIAlertController(title: "You have successfully added the product to the cart", message: "Go to the shopping cart to view", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)

        }
    }
}
