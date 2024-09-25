//
//  ProductDetailInteractor.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import NetworkKit

final class ProductDetailInteractor : PresenterToInteractorProductDetailProtocol {
 
    var presenter : InteractorToPresenterProductDetailProtocol?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    
    
    func fetchColor() async {
        do{
            let response = try await networkManager.fetch(target: .colors, 
                                                          responseClass: DataResult<[ColorResult]>.self)
            let result = response.data
            presenter?.sendColor(colors: result)
        }catch{
            print("laptop interactor error")
        }
    }
    
    func fetchMemorySize() async {
        do{
            let response = try await networkManager.fetch(target: .memorySizes, 
                                                          responseClass: DataResult<[MemorySizeResult]>.self)
            let result = response.data
            presenter?.sendMemorySize(memorySizes: result)
        }catch{
            print("laptop interactor error")
        }
    }
    
    
    func fetchProductDetail(id:Int,product_id:Int) async {
        do{
            let response = try await networkManager.fetch(target: .getSmartPhoneDetail(id, product_id), 
                                                          responseClass: DataResult<ProductDetailResult>.self)
            let result = response.data
            presenter?.sendProductDetail(productDetail: result)
        }catch{
            print("product detai error")
        }
    }
    
    
    func fetchInventoryInfo(product_id: Int) async {
        do{
            let response = try await networkManager.fetch(target: .getInventoryByProductId(product_id),
                                                          responseClass: DataResult<[InventoryResult]>.self)
            let result = response.data
            presenter?.sendInventoryResult(inventorResult: result)
            
        }catch{
            print("inventory error")
        }
    }
    

    
 
    
}
