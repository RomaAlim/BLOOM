//
//  NetworkAdminAL.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 17.05.2023.
//

import Foundation

import Foundation
import Alamofire

class NetworkAdminAL {
    let url = "https://64455764b80f57f581b7e94f.mockapi.io/api/v1/Clients"

    func DecoderAL(completion: @escaping ([ClientList])->()){
        AF.request(url, method: .get).responseData { response in
            if let  err = response.error {
                print(err.localizedDescription)
                print("Error")
            } else{
                if let data = response.data{
                    let responseData = try? JSONDecoder().decode([ClientList].self, from: data)
                    completion(responseData ?? [])
                    print("Success")
                    print("Received data:", responseData as Any)
                }
            }
        }
    }
}
