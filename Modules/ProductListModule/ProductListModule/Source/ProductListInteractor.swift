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
            let response = try await networkManager.fetch(target: .smartPhones, responseClass: DataResult<SmartPhoneResult>.self)
            let resultData : [BaseProduct] = response.data.map({ data in
                return BaseProduct(id: data.id, imageurl: data.imageurl, name: data.name, price: data.price)
            })
            presenter?.sendData(resultData: resultData)
        }catch{
            print("smart phone interactor error \(error.localizedDescription)")
        }
    }
    
    
    func fetchLaptopProducts() async  {
        do{
            let response = try await networkManager.fetch(target: .laptops, responseClass: DataResult<LaptopResult>.self)
            let resultData : [BaseProduct] = response.data.map({ data in
                return BaseProduct(id: data.id, imageurl: data.imageurl, name: data.name, price: data.price)
            })
            presenter?.sendData(resultData: resultData)
        }catch{
            print("laptop interactor error")
        }
    }
    
    
    func fetchTshirtsProducts() async {
        do{
            let response = try await networkManager.fetch(target: .thirsts, responseClass: DataResult<ClothesResult>.self)
            let resultData : [BaseProduct] = response.data.map({ data in
                return BaseProduct(id: data.id, imageurl: data.imageurl, name: data.name, price: data.price)
            })
            presenter?.sendData(resultData: resultData)
        }catch{
            print("smart phone interactor error")
        }
    }
    
    func fetchJumpersProducts() async {
        do{
            let response = try await networkManager.fetch(target: .jumpers, responseClass: DataResult<ClothesResult>.self)
            let resultData : [BaseProduct] = response.data.map({ data in
                return BaseProduct(id: data.id, imageurl: data.imageurl, name: data.name, price: data.price)
            })
            presenter?.sendData(resultData: resultData)
        }catch{
            print("smart phone interactor error")
        }
    }
    
    
    
}
