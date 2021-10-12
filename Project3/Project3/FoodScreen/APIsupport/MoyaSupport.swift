//
//  MoyaSupport.swift
//  Project3
//
//  Created by Anna Han on 12/11/20.
//

import Foundation
import Moya

//private let apiKey = "220b782e74fd736323077e3e332e8be3" //"https://developers.zomato.com"
private let apiKey = "FX1W87DA6rogVfMAySLadOkHGPNKJq1mGlKOVlX2W7CsClY9TGCbR9irAt5Hp0ujAoFn2jc1MtvxnWVet3Xa5R0ZByMhVKBS2CZg7pJbiuVVJ6xB5ndJSTfKKQDVX3Yx"
enum YelpSupport{
    
    enum BusinessesProvider: TargetType{
    
//        https://api.yelp.com/v3/businesses/search?latitude={{latitude}}&longitude={{longitude}}&limit={{limit}}&offset={{offset}}&term={{query}}&categories={{categories}}&price={{price}}&attributes={{attributes}}&location={{location}}

        case search(latitude:Double, longitude:Double)
        var baseURL: URL{
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }
        var path: String{
            switch  self {
            case .search:
                return "/search"
            }
        }
        var method: Moya.Method{
            return .get
        }
        var sampleData: Data{
            return Data()
        }
        var task: Task{
            switch self {
            case let .search(latitude, longitude):
                return .requestParameters(parameters: ["latitude":latitude, "longitude":longitude, "limit": 1], encoding: URLEncoding.queryString)
            }
        }
        var headers: [String : String]?{
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
}
