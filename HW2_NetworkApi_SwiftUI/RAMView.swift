//
//  RAMView.swift
//  HW2_NetworkApi_SwiftUI
//
//  Created by Сергей on 15/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI

struct RAMView: View {
    
    @EnvironmentObject var personListVM: PersonListViewModel
    
    var body: some View {
        List(personListVM.persons) { person in
            VStack(alignment: .leading) {
                RAMCellView(person: person)
                if self.personListVM.isNewPageLoading && self.personListVM.persons.isLastItem(person) {
                    Divider()
                    ActivityIndicatorView()
                }
            }.onAppear {
                self.onItemShowed(person)
            }
        }
    }
}

extension RAMView {
    private func onItemShowed<T:Identifiable>(_ item: T) {
        if personListVM.persons.isLastItem(item) {
            personListVM.pageLoad()
        }
    }
}
