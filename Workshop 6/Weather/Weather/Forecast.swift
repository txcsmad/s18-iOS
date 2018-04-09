//
//  Forecast.swift
//  Weather
//
//  Created by Jesse Tipton on 3/5/18.
//  Copyright © 2018 MAD. All rights reserved.
//

import Foundation

struct Forecast: Codable {
    
    struct Currently: Codable {
        let apparentTemperature: Double
        let temperature: Double
        let summary: String
    }
    
    let currently: Currently
    
}
