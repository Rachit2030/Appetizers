//
//  AppetizerListview.swift
//  Appetizers
//
//  Created by Rachit on 04/05/24.
//

import SwiftUI

struct AppetizerListview: View {
    @StateObject var viewmodel = AppetizerListViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewmodel.appetizers) { appetizer in
                                       
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewmodel.isShowingDetailView = true
                            viewmodel.currentAppetizer = appetizer
                        }
                                        
                    
//                    NavigationLink(destination: AppetizerDetailView(appetizer: appetizer)) {
//                        AppetizerListCell(appetizer: appetizer)
//                            
//                    }
                } .navigationTitle("Appetizers 🍟")
                    .listStyle(PlainListStyle())
                //            .navigationDestination(for: Appetizer.self){ object in
                //                AppetizerDetailView(appetizer: object)
                //            }
            }
            .blur(radius: viewmodel.isShowingDetailView ? 20 : 0)
            .scrollDisabled(viewmodel.isShowingDetailView)
//            .onAppear(perform: {
//                viewmodel.getAppetizers()
//            })
            .task {
                viewmodel.getAppetizers()
            }
            .alert(item: $viewmodel.alertItem){ alert in
                Alert(title: alert.title,message: alert.message, dismissButton: alert.dismissButton)
            }
            if(viewmodel.isLoading){
                LoadingView()
            }
            
            if(viewmodel.isShowingDetailView){
                AppetizerDetailView(appetizer: viewmodel.currentAppetizer!,isShowingDetailView: $viewmodel.isShowingDetailView)
            }
        }
    }
    
    
    
}

#Preview {
    AppetizerListview()
}
