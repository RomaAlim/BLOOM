//
//  Network Model.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 17.05.2023.
//

import UIKit

struct ClientList: Codable {
    let id: String
    let fullName: String
    let address: String
    let numberTelephone: String
    let AddInfo: String

    private enum CodingKeys: String, CodingKey {
        case fullName = "fullName"
        case address = "address"
        case numberTelephone = "numberTelephone"
        case AddInfo = "AddInfo"
        case id
    }
}
