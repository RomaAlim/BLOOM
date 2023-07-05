//
//  ProductSctruct.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 23.04.2023.
//
//

import UIKit

struct ProductFull: Codable {
    let id: String
    let Brand: String
    let TypeProduct: String
    let Cost: String
    let imageName: String
    let Description: String
    let Сomposition: String
    let Application: String
    let AddInfo: String

    var imageURL: URL? {
        guard let url = URL(string: imageName) else { return nil }
        return url
    }

    private enum CodingKeys: String, CodingKey {
        case Brand = "Brand"
        case TypeProduct = "TypeProduct"
        case Cost = "Cost"
        case imageName = "imageName"
        case Description = "Description"
        case Сomposition = "Composition"
        case Application = "Application"
        case AddInfo = "AddInfo"
        case id
    }
    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }.resume()
    }

}
