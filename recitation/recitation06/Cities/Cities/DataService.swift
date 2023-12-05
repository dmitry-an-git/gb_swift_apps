//
//  DataService.swift
//  Cities
//
//  Created by Dmitry An on 04/12/2023.
//

import Foundation

final class DataService {
    
    private var userDefaults = UserDefaults.standard
    
    func putData(cities: [City]) {
        for (index,city) in cities.enumerated() {
            userDefaults.set(city.name, forKey: "name" + String(index))
            userDefaults.set(city.currency, forKey: "currency" + String(index))
            userDefaults.set(city.timezone, forKey: "timezone" + String(index))
            userDefaults.set(city.coords.lat, forKey: "lat" + String(index))
            userDefaults.set(city.coords.lon, forKey: "lon" + String(index))
        }
    }
    
    func getData() -> [City] {
        var models:[City] = []
        var index = 0
        var isExist = userDefaults.string(forKey: "name0") != nil
        while isExist {
            models.append(
                City(
                    name: userDefaults.string(forKey: "name" + String(index)) ?? "",
                    coords: City.Coordinates(
                        lat: userDefaults.double(forKey: "lat" + String(index)),
                        lon: userDefaults.double(forKey: "lon" + String(index))
                    ),
                    timezone: userDefaults.string(forKey: "timezone" + String(index)) ?? "",
                    currency: userDefaults.string(forKey: "currency" + String(index)) ?? ""
                )
            )
            index += 1
            isExist = userDefaults.string(forKey: "name" + String(index)) != nil
            
        }
        return models
    }
    
    
}
