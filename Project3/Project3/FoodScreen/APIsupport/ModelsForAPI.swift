//
//  ModelsForAPI.swift
//  Project3
//
//  Created by Anna Han on 12/12/20.
//

import Foundation
//for json object
struct Root: Codable{
    let businesses: [Business]
}
struct Business: Codable{
    let id: String
    let name: String
    let image_url: URL
    let distance: Double
}
struct RestaurantListModel{
    let id: String
    let name: String
    let image_url: URL
    let distance: String
}
extension RestaurantListModel{
    init(business: Business) {
        self.name = business.name
        self.id = business.id
        self.image_url =  business.image_url
        self.distance = "\(business.distance / 1609.344)"
    }
}
