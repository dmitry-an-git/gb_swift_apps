//
//  ContentView.swift
//  hwproject
//
//  Created by Dmitry An on 03/12/2023.
//

// Необходимо реализовать два экрана. На первом только текст или кнопка или ссылка. По клику на текст/кнопку/ссылку необходимо перейти на следующий экран. На следующем экране должна отображаться таблица (после загрузки данных из сети), в которой содержатся новости. В ячейке должно быть название новости и дата публикации. Внешний вид на ваше усмотрение. Для получения новостей изучите api: https://docs.kudago.com/api/#page:новости,header:новости-список-новостей/api/#page:новости,header:новости-список-новостей

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationLink("NextView", destination: { NextView()
        })
        .navigationTitle("First Screen")
    }
}

struct NextView: View {
    @ObservedObject var fetcher = NewsFetcher()

    var body: some View {
        NavigationView {
            List(fetcher.newsItems) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text("Published on \(Date(timeIntervalSince1970: TimeInterval(item.publicationDate)))")
                        .font(.subheadline)
                }
            }
            .navigationTitle("News Screen")
        }
        .onAppear {
            fetcher.fetchNews()
        }
    }
}



#Preview {
    NextView()
}

