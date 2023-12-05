//
//  FileCache.swift
//  hwproject
//
//  Created by Dmitry An on 04/12/2023.
//

import Foundation
import CoreData

class FileCache {
    
    lazy var context = {
            let container = NSPersistentContainer(name: "NewsDataModelTest")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error {
                    print(error)
                }
            })
        return container.viewContext
        }()
    
    func fetchAllNews() -> [NewsDataModelTest] {
        do {
            let news = try context.fetch(NewsDataModelTest.fetchRequest())
            return news
        } catch {
            return []
        }
    }
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    func createNews(id: Int, title: String, publicationDate: Date) {
        let news = NewsDataModelTest(context: context)
        news.id = Int32(id)
        news.title = title
        news.publicationDate = publicationDate
        save()
    }
    
    func deleteNews(news: NewsDataModelTest) {
        context.delete(news)
        save()
    }
    
    func addNews(news: [NewsDataModel.News]) {
        for newsItem in news {
            createNews(
                id: newsItem.id,
                title: newsItem.title,
                publicationDate: Date(timeIntervalSince1970: TimeInterval(newsItem.publicationDate))
            )
        }
    }
    
}
