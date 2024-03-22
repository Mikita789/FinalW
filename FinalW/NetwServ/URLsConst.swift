//
//  URLsConst.swift
//  FinalW
//
//  Created by Никита Попов on 22.03.24.
//

import Foundation

enum URLsConst{
    case toAirport
    case fromAirport
    case copyright
    
    var urlRes: URL?{
        
        let urlKey = "843d0270-9f21-492b-9930-d59c52de110a"
        var comp = URLComponents()
        comp.scheme = "https"
        comp.host = "api.rasp.yandex.net"
        if self == .fromAirport || self == .toAirport{
            comp.path = "/v3.0/schedule/"
            comp.queryItems = [
                URLQueryItem(name: "apikey", value: urlKey),
                URLQueryItem(name: "transport_types", value: "plane"),
                URLQueryItem(name: "event", value: self == .toAirport ? "arrival" : "departure"),
                URLQueryItem(name: "station", value: "s9600215")
            ]
        }
        //https://api.rasp.yandex.net/v3.0/copyright/?apikey={ключ}&format=json
        if self == .copyright{
            comp.path = "/v3.0/copyright/"
            comp.queryItems = [
                URLQueryItem(name: "apikey", value: urlKey),
                URLQueryItem(name: "format", value: "json")
            ]
        }
        
        return comp.url
    }
}
