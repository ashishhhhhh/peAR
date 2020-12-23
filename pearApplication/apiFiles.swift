//
//  apiFiles.swift
//  pearApplication
//
//  Created by TARUN on 12/22/20.
//  Copyright © 2020 ashish. All rights reserved.
//

import Foundation
struct restuarantData: Decodable {
    let _id: String?
    let batch: [Batch]
    let timestamp: String?
    let restaurant_name: String?
    let restaurant_image: String?
    let restaurant_location: String?
    let grand_total: Double?
}

struct Batch: Decodable {
    let items: [Items]
}

struct Items: Decodable {
    let name: String?
    let quantity: Int?
}
