//
//  ImageLoader.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 25.04.2023.
//

//import Foundation
//import UIKit
//
//class ImageLoader {
//    
//    static func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completion(nil)
//                return
//            }
//            let image = UIImage(data: data)
//            completion(image)
//        }.resume()
//    }
//}
