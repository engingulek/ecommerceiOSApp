//
//  ProductListInteractor.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation
import NetworkKit

final class ProductListInteractor : PresenterToInteractorProductListProtocol {

    var presenter : InteractorToPresenterProductListProtocol?
    
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    
    func fetchSmartPhoneProducts() async throws {
        do{
            let response = try await networkManager.fetch(target: .smartPhones, responseClass: DataResult<[ProductResult]>.self)
            let result = response.data
            presenter?.sendData(resultData: result)
           
        }catch{
            throw error
        }
    }
    
    
    func fetchLaptopProducts() async throws {
        do{
            let response = try await networkManager.fetch(target: .laptops, responseClass: DataResult<[ProductResult]>.self)
            let result = response.data
            presenter?.sendData(resultData: result)
        }catch{
            throw error
        }
    }
    
    
    func fetchTshirtsProducts() async throws{
        do{
            let response = try await networkManager.fetch(target: .thirsts, responseClass: DataResult<[ProductResult]>.self)
            let result = response.data
            presenter?.sendData(resultData: result)
        }catch{
            throw error
        }
    }
    
    func fetchJumpersProducts() async throws {
        do{
            let response = try await networkManager.fetch(target: .jumpers, responseClass: DataResult<[ProductResult]>.self)
            let result = response.data
            presenter?.sendData(resultData: result)
        }catch{
            throw error
        }
    }
    
    
    
}
