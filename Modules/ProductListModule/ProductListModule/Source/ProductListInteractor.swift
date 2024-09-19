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
    
    func fetchSmartPhoneProducts() async {
        do{
            let response = try await networkManager.fetch(target: .smartPhones, responseClass: DataResult<ElectronicResult<Size, Color>>.self)
            presenter?.sendDataSmartPhonesProduct(resultData: response.data)
        }catch{
            print("smart phone interactor error \(error.localizedDescription)")
        }
    }
    
    
    func fetchLaptopProducts() async  {
        do{
            let response = try await networkManager.fetch(target: .laptops, responseClass: DataResult<ElectronicResult<Size, Int>>.self)
            presenter?.sendDataLaptopsProduct(resultData: response.data)
        }catch{
            print("smart phone interactor error")
        }
    }
    
    
}
