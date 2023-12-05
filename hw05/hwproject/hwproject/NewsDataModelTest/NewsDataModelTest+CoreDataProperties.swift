//
//  NewsDataModelTest+CoreDataProperties.swift
//  hwproject
//
//  Created by Dmitry An on 04/12/2023.
//
//

import Foundation
import CoreData


extension NewsDataModelTest {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsDataModelTest> {
        return NSFetchRequest<NewsDataModelTest>(entityName: "NewsDataModelTest")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var publicationDate: Date?

}

extension NewsDataModelTest : Identifiable {

}
