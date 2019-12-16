//
//  ActivityIndicatorView.swift
//  HW2_NetworkApi_SwiftUI
//
//  Created by Сергей on 16/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityIndicatorView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
    
}
