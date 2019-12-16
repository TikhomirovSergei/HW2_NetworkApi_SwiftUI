//
//  NewsView.swift
//  HW2_NetworkApi_SwiftUI
//
//  Created by Сергей on 14/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject var articlesListVM: ArticlesListViewModel
    
    var body: some View {
        //Text("")
        List(articlesListVM.articles) { article in
            VStack(alignment: .leading) {
                Text(article.title ?? "")
                // Loading
                if self.articlesListVM.isNewPageLoading && self.articlesListVM.articles.isLastItem(article) {
                    Divider()
                    Text("Loading...")
                }
            }.onAppear {
                self.onItemShowed(article)
            }
        }
    }
}

extension NewsView {
    private func onItemShowed<T:Identifiable>(_ item: T) {
        
        if articlesListVM.articles.isLastItem(item) {
            
            print(true)
            articlesListVM.pageLoad()
        }
    }
}
