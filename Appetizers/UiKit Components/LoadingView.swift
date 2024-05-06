//
//  LoadingView.swift
//  Appetizers
//
//  Created by Rachit on 05/05/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    
    typealias UIViewType = UIActivityIndicatorView
    
    func makeUIView(context: Context) -> UIViewType {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
}

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            ActivityIndicator()
        }
    }
}
