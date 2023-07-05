//
//  NetworkURL.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 25.04.2023.
//

import Foundation

//func fetchProducts(completion: @escaping ([ProductFull]) -> Void) {
//    guard let url = URL(string: "https://64455764b80f57f581b7e94f.mockapi.io/api/v1/Products") else {
//        completion([])
//        return
//    }
//    let session = URLSession.shared
//    let task = session.dataTask(with: url) { data, response, error in
//        if let error = error {
//            print("Ошибка: \(error)")
//            completion([])
//            return
//        }
//        guard let data = data else {
//            completion([])
//            return
//        }
//        do {
//            let jsonData = try JSONDecoder().decode([ProductFull].self, from: data)
//            completion(jsonData)
//        } catch {
//            print("Ошибка декодирования JSON: \(error)")
//            completion([])
//        }
//    }
//    task.resume()
//}
