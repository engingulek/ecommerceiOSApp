//
//  CategoryInteractor.swift
//  CategoryModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation
import NetworkKit
class CategoryInteractor : PresenterToInteractorCategoryProtocol {
    var presenter : InteractorToPresenterCategoryProtocol?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    func fetchCategories() async throws {
        do {
            let response = try await networkManager.fetch(target: .categories, responseClass: DataResult<CategoryResult>.self)
            presenter?.sendData(categoryResult: response.data)
        }catch{
            print("interactor error")
        }
       
    }
    
    
}
