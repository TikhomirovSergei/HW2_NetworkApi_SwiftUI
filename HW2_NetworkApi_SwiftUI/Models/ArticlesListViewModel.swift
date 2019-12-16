//
//  ArticlesListViewModel.swift
//  HW2_NetworkApi_SwiftUI
//
//  Created by Сергей on 14/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI

final class ArticlesListViewModel: ObservableObject {
    
    @Published private(set) var articles: [Article] = []
    @Published var pageIndex: Int = 1
    @Published var isNewPageLoading = false
    
    init() {
        pageLoad()
    }
    
    func pageLoad() {
        
        guard isNewPageLoading == false else { return }
        
        isNewPageLoading = true
        pageIndex += 1
        
        ArticlesAPI.everythingGet(q: "business", from: "2019-12-15", sortBy: "publishedAt", apiKey: "a9b0a70b40c7497fae2f6cff41567103") { list, error in
            
            self.articles.append(contentsOf: list?.articles ?? [])
            self.isNewPageLoading = false
        }
    }
}

extension Article: Identifiable {
    public var id: String {
        return url ?? UUID().uuidString
    }
}
