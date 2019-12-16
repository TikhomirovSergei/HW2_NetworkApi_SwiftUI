//
//  PersonListViewModel.swift
//  HW2_NetworkApi_SwiftUI
//
//  Created by Сергей on 15/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI

final class PersonListViewModel: ObservableObject {
    
    @Published private(set) var persons: [Person] = []
    @Published var pageIndex: Int = 0
    @Published var isNewPageLoading = false
    
    init() {
        pageLoad()
    }
    
    func pageLoad() {
        
        guard isNewPageLoading == false else { return }
        
        isNewPageLoading = true
        pageIndex += 1
        
        PersonsAPI.callGet(page: pageIndex) { list, error in
            self.persons.append(contentsOf: list?.results ?? [])
            self.isNewPageLoading = false
        }
    }
}

extension Person: Identifiable { }
