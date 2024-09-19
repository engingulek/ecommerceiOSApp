//
//  ProductListPresenter.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation
import UICommonKit
final class ProductListPresenter {
    weak var view : PresenterToViewProductListProtocol?
    private let interactor : PresenterToInteractorProductListProtocol
    private let router : PresenterToRouserProductListProtocol
    private var baseProducts : [BaseProduct] = []
    init(view: PresenterToViewProductListProtocol?, 
         interactor: PresenterToInteractorProductListProtocol = ProductListInteractor(),
         router: PresenterToRouserProductListProtocol = ProductListRouter()) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func getSmartPhones() async {
        await interactor.fetchSmartPhoneProducts()
        
    }
    
    private func getLaptops() async {
        await interactor.fetchLaptopProducts()
    }
}


//MARK: ViewToPresenterProductListProtocol
extension ProductListPresenter : ViewToPresenterProductListProtocol {
    
    func viewDidLoad() {
        view?.reloadCollectionView()
    }
    
    func getSubCategoryId(subCategoryId: Int) {
        switch subCategoryId {
        case 1:
            Task{
                await getSmartPhones()
                view?.reloadCollectionView()
            }
            view?.changeTitle(title: TextTheme.smartPhones.rawValue)
            
        case 2:
            Task{
                await getLaptops()
                view?.reloadCollectionView()
            }
            view?.changeTitle(title: TextTheme.laptops.rawValue)
            
        default:
            print("Switch Error")
        }
        
    }
    
    func numberOfItemsInSection() -> Int {
        return baseProducts.count
    }
    

    
    func collectionViewCellForItem(at indexPath: IndexPath) -> BaseProduct {
        return baseProducts[indexPath.item]
    }
    
   
}

//MARK: InteractorToPresenterProductListProtocol
extension ProductListPresenter : InteractorToPresenterProductListProtocol {
    
    func sendDataSmartPhonesProduct(resultData: [ElectronicResult<Size, Color>]) {
        baseProducts = resultData.map({ smartPhone in
            return BaseProduct(id: smartPhone.id, imageurl: smartPhone.imageurl, name: smartPhone.name, price: smartPhone.price)
        })
    }
    
    func sendDataLaptopsProduct(resultData: [ElectronicResult<Size, Int>]) {
        baseProducts = resultData.map({ smartPhone in
            return BaseProduct(id: smartPhone.id, imageurl: smartPhone.imageurl, name: smartPhone.name, price: smartPhone.price)
        })
    }
}
