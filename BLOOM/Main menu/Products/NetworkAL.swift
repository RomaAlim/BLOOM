//
//  NetworkAL.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 23.04.2023.
//
//
import Foundation
import Alamofire

class NetworkAL {
    let url = "https://64455764b80f57f581b7e94f.mockapi.io/api/v1/Products"


    func DecoderAL(completion: @escaping ([ProductFull])->()){
        AF.request(url, method: .get).responseData { response in
            if let  err = response.error {
                print(err.localizedDescription)
                print("Error")
            } else{
                if let data = response.data{
                    let responseData = try? JSONDecoder().decode([ProductFull].self, from: data)
                    completion(responseData ?? [])
                    print("Success")
                    //print("Received data:", responseData as Any)
                }
            }
        }
    }
}






