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
    
    private func getTshirts() async {
        await interactor.fetchTshirtsProducts()
    }
    
    private func getJumpers() async {
        await interactor.fetchJumpersProducts()
    }
}


//MARK: ViewToPresenterProductListProtocol
extension ProductListPresenter : ViewToPresenterProductListProtocol {
    
    func viewDidLoad() {
        view?.reloadCollectionView()
        view?.setBackColorCollectionViewController(color: ColorTheme.secondaryBackColor.rawValue)
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
        case 6:
            Task{
                await getTshirts()
                view?.reloadCollectionView()
            }
            view?.changeTitle(title: TextTheme.tshirts.rawValue)
        case 7:
            Task{
                await getJumpers()
                view?.reloadCollectionView()
            }
            view?.changeTitle(title: TextTheme.jumpers.rawValue)
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
    func sendData(resultData: [BaseProduct]) {
        baseProducts = resultData
    }
}
