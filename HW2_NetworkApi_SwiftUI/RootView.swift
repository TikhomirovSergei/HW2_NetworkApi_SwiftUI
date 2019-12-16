//
//  RootView.swift
//  HW2_NetworkApi_SwiftUI
//
//  Created by Сергей on 13/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI
import UIKit

struct RootView: View {
    
    @State private var pickerSelection: Int = 0
    
    var body: some View {
        NavigationView {
            VStack() {
                Picker(selection: $pickerSelection, label: Text("NetworkApi?")) {
                    Text("News").tag(0)
                    Text("RickAndMorti").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                
                if pickerSelection == 0 {
                    NewsView().environmentObject(ArticlesListViewModel())
                } else {
                    RAMView().environmentObject(PersonListViewModel())
                }/*
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(0..<2) { index in
                            VStack() {
                                if index == 0 {
                                    NewsView().environmentObject(ArticlesListViewModel())
                                } else {
                                    RAMView().environmentObject(PersonListViewModel())
                                }
                            }
                            .scaledToFill()
                            //.frame(width: 350, height: 450, alignment: .center)
                        }
                    }
                }*/
            }
            .navigationBarTitle("Network api")
        }
    }
}

struct RootVwView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
