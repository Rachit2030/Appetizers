//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Rachit on 05/05/24.
//

import Foundation

@MainActor class AppetizerListViewModel: ObservableObject{
    @Published  var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetailView = false
    @Published var currentAppetizer: Appetizer?
    // @Published var isShowingDetail = false
    
    //    func getAppetizers(){
    //            isLoading = true
    //            NetworkManager.shared.getAppetizers{ result in
    //                DispatchQueue.main.async { [self] in
    //                    isLoading = false
    //                    switch result{
    //                    case .success(let appetizer):
    //                        appetizers = appetizer
    //
    //
    //                    case .failure(let error):
    //                        switch(error){
    //                        case .invalidData: alertItem = AlertContext.invalidData
    //                        case .invalidResponse: alertItem = AlertContext.invalidResponse
    //                        case .invalidURL: alertItem = AlertContext.invalidURL
    //                        case .unableToComplete: alertItem = AlertContext.unableToComplete
    //                        }
    //                    }
    //                }
    //            }
    //    }
    
    func getAppetizers(){
        isLoading = true
        Task{
            do{
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            }catch{
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
        
    }
}
