//
//  ProductListPresenter.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation
import UICommonKit
import RealmSwiftManager
final class ProductListPresenter {
    
    weak var view : PresenterToViewProductListProtocol?
    private let interactor : PresenterToInteractorProductListProtocol
    private let router : PresenterToRouserProductListProtocol
    private let realmManager : RealmSwiftManagerProtocol = RealmSwiftManager()
    private var baseProducts : [ProductResult] = []
    private var lastProducts  : [ProductResult] = []
    
    init(view: PresenterToViewProductListProtocol?,
         interactor: PresenterToInteractorProductListProtocol,
         router: PresenterToRouserProductListProtocol = ProductListRouter()) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func getSmartPhones() async {
        do{
          try await interactor.fetchSmartPhoneProducts()
        }catch{
            view?.createAlertMesssage(title: TextTheme.errorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue,
                                      actionTitle: TextTheme.primaryActionTitle.rawValue)
        }
    }
    
    private func getLaptops() async {
        do{
           try await interactor.fetchLaptopProducts()
        }catch{
            view?.createAlertMesssage(title: TextTheme.errorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue,
                                      actionTitle: TextTheme.primaryActionTitle.rawValue)
        }
    }
    
    private func getTshirts() async {
        do{
          try  await interactor.fetchTshirtsProducts()
        }catch{
            view?.createAlertMesssage(title: TextTheme.errorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue,
                                      actionTitle: TextTheme.primaryActionTitle.rawValue)
        }
    }
    
    private func getJumpers() async {
        do{
           try await interactor.fetchJumpersProducts()
        }catch{
            view?.createAlertMesssage(title: TextTheme.errorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue,
                                      actionTitle: TextTheme.primaryActionTitle.rawValue)
        }
    }
}


//MARK: ViewToPresenterProductListProtocol
extension ProductListPresenter : ViewToPresenterProductListProtocol {
    
    
    func viewDidLoad() {
        view?.reloadCollectionView()
        view?.prepareCollectionView()
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.searchTextFieldPlacholder(placholderText: TextTheme.searchPlaceholder.rawValue)
        
    }
    
    func getSubCategoryId(subCategoryId: Int) {
        switch subCategoryId {
        case 1:
            view?.startIndicator()
            Task{
                await getSmartPhones()
                view?.reloadCollectionView()
                view?.stopIndicator()
            }
            view?.changeTitle(title: TextTheme.smartPhones.rawValue)
            
        case 2:
            view?.startIndicator()
            Task{
                await getLaptops()
                view?.reloadCollectionView()
                view?.stopIndicator()
            }
            view?.changeTitle(title: TextTheme.laptops.rawValue)
        case 6:
            view?.startIndicator()
            Task{
                await getTshirts()
                view?.reloadCollectionView()
                view?.stopIndicator()
            }
            view?.changeTitle(title: TextTheme.tshirts.rawValue)
        case 7:
            view?.startIndicator()
            Task{
                await getJumpers()
                view?.reloadCollectionView()
                view?.stopIndicator()
            }
            view?.changeTitle(title: TextTheme.jumpers.rawValue)
        default:
            view?.createAlertMesssage(title: TextTheme.errorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue,
                                      actionTitle: TextTheme.primaryActionTitle.rawValue)
        }
        
    }
    
    func searchProductList(searchText: String?) {
        guard let searchText = searchText else {return}
        view?.startIndicator()
        if searchText.isEmpty {
            lastProducts = baseProducts
            view?.setEmptyMessageForYou(text: TextTheme.noneText.rawValue)
        }else{
            
            if lastProducts.isEmpty {
                view?.setEmptyMessageForYou(text: TextTheme.emptyList.rawValue)
            }else{
                lastProducts = baseProducts.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
            }
        }
        
        view?.reloadCollectionView()
        view?.stopIndicator()
    }
    
    func numberOfItemsInSection() -> Int {
        return lastProducts.count
    }
    
    func collectionViewCellForItem(at indexPath: IndexPath) -> (product:ProductResult,radius:Double,backColor:String) {
        
        return ( lastProducts[indexPath.item],
                 RadiusTheme.xSmall.rawValue,
                 ColorTheme.primaryBackColor.rawValue)
    }
    
    func insetForSectionAt() -> (top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) {
        return (top:10,left:10,right:10,bottom:10)
    }
    
    func minimumLineSpacingForSectionAt() -> CGFloat {
        return 10
    }
    
    func minimumInteritemSpacingForSectionAt() -> CGFloat {
        return 10
    }
    
    func didSelectItemAt(at indexPath: IndexPath) {
        let product = lastProducts[indexPath.item]
        realmManager.addLastViewedProduct(id: product.id,
                                          name: product.name,
                                          imageUrl: product.imageurl[0], 
                                          price: product.price)
        router.toProductDetailModule(view: view, id: product.id, product_id: product.product_id)
    }
    
    
    func sortAscendingPrice() {
        lastProducts = lastProducts.sorted { $0.price < $1.price}
        view?.reloadCollectionView()
    }
    
    func sortDescendingPrice() {
        lastProducts = lastProducts.sorted { $0.price > $1.price}
        view?.reloadCollectionView()
    }
   
}

//MARK: InteractorToPresenterProductListProtocol
extension ProductListPresenter : InteractorToPresenterProductListProtocol {
    func sendData(resultData: [ProductResult]) {
       baseProducts = resultData
      lastProducts = resultData
    }
}
