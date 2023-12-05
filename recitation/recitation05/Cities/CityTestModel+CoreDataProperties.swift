//
//  CityTestModel+CoreDataProperties.swift
//  Cities
//
//  Created by Dmitry An on 04/12/2023.
//
//

import Foundation
import CoreData


extension CityTestModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CityTestModel> {
        return NSFetchRequest<CityTestModel>(entityName: "CityTestModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var currency: String?
    @NSManaged public var timezone: String?
    @NSManaged public var lat: Double
    @NSManaged public var lon: Double

}

extension CityTestModel : Identifiable {

}
