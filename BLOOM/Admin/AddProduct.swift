//
//  AddProduct.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 23.04.2023.
//

import UIKit

class AddProduct: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var typeProductTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var CompositionTextField: UITextField!
    @IBOutlet weak var applicationTextField: UITextField!
    @IBOutlet weak var addInfoTextField: UITextField!
    
    @IBOutlet weak var SaveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //
    let url = "https://64455764b80f57f581b7e94f.mockapi.io/api/v1/Products"

  //  var dataArray: [[String: Any]] = []
//
    
    @IBAction func SaveProduct(_ sender: UIButton) {
        checkData()
        BackVC()
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
    
    func checkData() {
        var dataDict: [String: Any] = [:]
        
        if let id = idTextField.text, !id.isEmpty {
            dataDict["id"] = id
        }
        
        if let brand = brandTextField.text, !brand.isEmpty {
            dataDict["Brand"] = brand
        }
        
        if let typeProduct = typeProductTextField.text, !typeProduct.isEmpty {
            dataDict["TypeProduct"] = typeProduct
        }
        
        if let cost = costTextField.text, !cost.isEmpty {
            dataDict["Cost"] = cost
        }
        
        if let image = imageTextField.text, !image.isEmpty {
            dataDict["imageName"] = image
        }
        
        if let description = descriptionTextField.text, !description.isEmpty {
            dataDict["Description"] = description
        }
        
        if let composition = CompositionTextField.text, !composition.isEmpty {
            dataDict["Composition"] = composition
        }
        
        if let application = applicationTextField.text, !application.isEmpty {
            dataDict["Application"] = application
        }
        
        if let addInfo = addInfoTextField.text, !addInfo.isEmpty {
            dataDict["AddInfo"] = addInfo
        }
        
        if !dataDict.isEmpty {
            sendProducts(dataDict)
        }
        
        print(dataDict)
    }
    
    func BackVC() {
        navigationController?.popViewController(animated: true)
    }
}



