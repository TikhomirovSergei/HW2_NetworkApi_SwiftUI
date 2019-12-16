//
//  RAMCellView.swift
//  HW2_NetworkApi_SwiftUI
//
//  Created by Сергей on 16/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI

struct RAMCellView: View {
    
    var person: Person
    
    var body: some View {
        HStack() {
            showImage(person.status ?? "").resizable().frame(width: 32, height: 32)
            VStack(alignment: .leading) {
                Text("Name: \(person.name ?? "-")")
                Text("Species: \(person.species ?? "-")")
                Text("Gender: \(person.gender ?? "-")")
            }
        }
    }
}

extension RAMCellView {
    
    private func showImage(_ status: String) -> Image {
        var imgName = "alive"
        
        switch status {
        case "Dead": imgName = "dead"
        case "unknown": imgName = "unknown"
        default: imgName = "alive"
        }
        
        return Image(imgName)
    }
}
