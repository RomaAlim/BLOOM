//
//  Products.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 15.04.2023.
//


//import Foundation
//
//class Base{
//    let defaults = UserDefaults.standard
//    
//    static let shared = Base()
//    struct Product: Codable {
//        let id:Int
//        let Brand:String
//        let TypeProduct:String
//        let Cost:String
//        let imageName: String
//
//    }
//    
//    var ListProduct:[Product]{
//        get {
//            if let data = defaults.value(forKey: "ListProduct") as? Data{
//                return try! PropertyListDecoder().decode([Product].self, from: data)
//            } else {
//                return [Product]()
//            }
//        }
//        set {
//            if let data = try? PropertyListEncoder().encode(newValue){
//                defaults.set(data, forKey: "ListProduct")
//            }
//        }
//    }
//    
//    func addToCart(brand: String, typeProduct: String, cost: String, imageName: String) {
//        var products = ListProduct
//        let id = (products.last?.id ?? 0) + 1
//        let product = Product(id: id, Brand: brand, TypeProduct: typeProduct, Cost: cost, imageName: imageName)
//        products.append(product)
//        ListProduct = products
//    }
//    
//    func deleteInCart(id: Int) {
//        ListProduct.removeAll(where: {$0.id == id})
//    }
//
//}
