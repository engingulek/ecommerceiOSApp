//
//  HomePresenter.swift
//  HomeModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import UICommonKit
import RealmSwiftManager
final class HomePresenter  {
    
    weak var view : PresenterToViewHomeProtocol?
    private let router : PresenterToRouterHomeProtocol
    private var lastViewedProduct : [LastViewedProductResult] = []
    private let realmManager : RealmSwiftManagerProtocol = RealmSwiftManager()
    
    init(view: PresenterToViewHomeProtocol,router:PresenterToRouterHomeProtocol = HomeRouter()) {
        self.view = view
        self.router = router
    }
    
    private  func lastViewedProductAction() {
        let result = realmManager.fetchLastViewedProduct()
        switch result {
        case .success(let list):
            if list.isEmpty {
                lastViewedProduct = []
                view?.setEmptyMessageLabel(text: TextTheme.emptyList.rawValue)
            }else{
                lastViewedProduct = list
                view?.setEmptyMessageLabel(text: "")
            }
            
        case .failure:
            view?.createAlertMesssage(title: TextTheme.errorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue,
                                      actionTitle: TextTheme.primaryActionTitle.rawValue)
        }
    }
}


extension HomePresenter : ViewToPresenterHomeProtocol {
    
    
    
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.prepareCollectionView()
     
        view?.changeTitle(title: TextTheme.homePage.rawValue)
        lastViewedProductAction()
        view?.reloadCollectionView()
    }
    
    func viewWillAppear() {
        lastViewedProductAction()
        view?.reloadCollectionView()
    }

    func categoriesButtonOnTapped() {
        router.toCategoryModule(view: view)
    }
    
    
    func numberOfItemsInSection() -> Int {
        return lastViewedProduct.count
    }
    
    func collectionViewCellForItem(at indexPath: IndexPath) -> (product: LastViewedProductResult, radius: Double, backColor: String) {
        return ( lastViewedProduct[indexPath.item],
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
    
    
}
