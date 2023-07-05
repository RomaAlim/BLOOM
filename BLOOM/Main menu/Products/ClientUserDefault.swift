//
//  ClientUserDefault.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 17.05.2023.
//

import Foundation

class BaseClient {
    let defaults = UserDefaults.standard
    
    static let shared = BaseClient()
    
    struct Client: Codable {
        let id: Int
        let fullName: String
        let address: String
        let numberTelephone: String
        let addInfo: String
    }
    
    var clientList: [Client] {
        get {
            if let data = defaults.value(forKey: "ClientList") as? Data {
                return try! PropertyListDecoder().decode([Client].self, from: data)
            } else {
                return [Client]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "ClientList")
            }
        }
    }
    
    func addClient(fullName: String, address: String, numberTelephone: String, addInfo: String) {
        var clients = clientList
        let id = (clients.last?.id ?? 0) + 1
        let client = Client(id: id, fullName: fullName, address: address, numberTelephone: numberTelephone, addInfo: addInfo)
        clients.append(client)
        clientList = clients
    }
    
    func deleteClient(id: Int) {
        clientList.removeAll { $0.id == id }
    }
}


//import Foundation
//
//class BaseClient {
//    let defaults = UserDefaults.standard
//
//    static let shared = BaseClient()
//
//    struct Client: Codable {
//        let id: Int
//        let fullName: String
//        let address: String
//        let numberTelephone: String
//        let addInfo: String
//    }
//
//    var clientList: [Client] {
//        get {
//            if let data = defaults.value(forKey: "ClientList") as? Data {
//                return try! PropertyListDecoder().decode([Client].self, from: data)
//            } else {
//                return [Client]()
//            }
//        }
//        set {
//            if let data = try? PropertyListEncoder().encode(newValue) {
//                defaults.set(data, forKey: "ClientList")
//            }
//        }
//    }
//
//    func addClient(fullName: String, address: String, numberTelephone: String, addInfo: String) {
//        var clients = clientList
//        let id = (clients.last?.id ?? 0) + 1
//        let client = Client(id: id, fullName: fullName, address: address, numberTelephone: numberTelephone, addInfo: addInfo)
//        clients.append(client)
//        clientList = clients
//    }
//
//    func deleteClient(id: Int) {
//        clientList.removeAll { $0.id == id }
//    }
//}
