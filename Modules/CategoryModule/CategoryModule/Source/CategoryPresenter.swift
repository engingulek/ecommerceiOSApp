//
//  CategoryPresenter.swift
//  CategoryModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import UICommonKit
import RealmSwiftManager
final class CategoryPresenter  {
    
    weak var view: PresenterToViewCategoryProtocol?
    private let interactor : PresenterToInteractorCategoryProtocol
    private let realmManager : RealmSwiftManagerProtocol = RealmSwiftManager()
    private var categories: [CategoryResult] = []
    private var subCategories : [SubCategories] = []
    
    private var selectedCategoryId: Int = -1
    private let router : PresenterToRouteCategoryProtocol
    
    init(view: PresenterToViewCategoryProtocol?,
         interactor:PresenterToInteractorCategoryProtocol = CategoryInteractor(),
         router:PresenterToRouteCategoryProtocol = CategoryRouter() ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func addLastViewCategory(subCategories:SubCategories) {
        realmManager.addLastViewCategory(id: subCategories.id, 
                                         name: subCategories.name,
                                         imageUrl: subCategories.icon)
    }
    
    private func getLastViewedCategories()  {
        
      let result = realmManager.fetchLastViewedCategory()
        
        switch result {
        case .success(let list):
            if list.isEmpty {
                view?.setEmptyMessageForYou(text: TextTheme.secondaryEmtyList.rawValue)
            }else{
                subCategories = list.map({ category in
                    return  SubCategories(id: category.id, name: category.name, icon: category.imageUrl)
                })
                view?.setEmptyMessageForYou(text: TextTheme.noneText.rawValue)
            }
            
        case .failure:
            view?.createAlertMesssage(title: TextTheme.errorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue,
                                      actionTitle: TextTheme.primaryActionTitle.rawValue)
        }
        
    }
}



extension CategoryPresenter  {
    
    func fetch() async {
        do{
            try await interactor.fetchCategories()
        }catch{
            view?.createAlertMesssage(title: TextTheme.errorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue,
                                      actionTitle: TextTheme.primaryActionTitle.rawValue)
        }
    }
}

//MARK: ViewToPresenterCategoryProtocol For TableView
extension CategoryPresenter : ViewToPresenterCategoryProtocol {
  
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.prepareCollectionView()
        view?.prepareTableView()
        
        getLastViewedCategories()
       
        view?.reloadCategoryTableView()
        view?.reloadSubCategoryCollectionView()
        view?.changeTitle(title: TextTheme.categories.rawValue)
        view?.speacialViewChangeUI(
            textColor: ColorTheme.thirdLabelColor.rawValue,
            backColor: ColorTheme.primaryBackColor.rawValue)
        Task {
            await fetch()
        }
    }
    
    
    func numberOfRowsInSection() -> Int {
        return categories.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> (
        text:String,
        textColor:String,
        backColor:String) {
            let text:String
            let textColor:String
            let backColor:String
            let category = categories[indexPath.row]
            text = category.name
            if category.id == selectedCategoryId {
                textColor = ColorTheme.thirdLabelColor.rawValue
                backColor = ColorTheme.primaryBackColor.rawValue
            }else{
                textColor = ColorTheme.secandaryLabelColor.rawValue
                backColor = ColorTheme.secondaryBackColor.rawValue
            }
            
            return (text,textColor,backColor)
            
        }
    
    func didSelectRow(at indexPath: IndexPath) {
    
        selectedCategoryId = categories[indexPath.row].id
        view?.speacialViewChangeUI(textColor: ColorTheme.secandaryLabelColor.rawValue, 
                                   backColor: ColorTheme.secondaryBackColor.rawValue)
        view?.reloadCategoryTableView()
        
        /// set subCategories
        subCategories = categories[selectedCategoryId - 1].subCategories
        view?.reloadSubCategoryCollectionView()
    }
    
    func specialViewOnTapped() {
        selectedCategoryId =  -1
        getLastViewedCategories()
        
        view?.speacialViewChangeUI(
            textColor: ColorTheme.thirdLabelColor.rawValue,
            backColor: ColorTheme.primaryBackColor.rawValue)
        view?.reloadCategoryTableView()
        view?.reloadSubCategoryCollectionView()
    }
    
}

//MARK: ViewToPresenterCategoryProtocol For CollectionView
extension CategoryPresenter {
    
    func numberOfItemsInSection() -> Int {
        return subCategories.count
    }
    
    func collectionViewCellForItem(at indexPath: IndexPath) -> SubCategories {
        let subCategory = subCategories[indexPath.item]
        return subCategory
    }
    func didSelectItemAt(at indexPath: IndexPath) {
        let subCategory =  subCategories[indexPath.row]
       addLastViewCategory(subCategories: subCategory)
        let subCategoryId = subCategory.id
        router.toProductListModule(view: view, subCategoryId: subCategoryId)
    }
    
}

//MARK: InteractorToPresenterCategoryProtocol
extension CategoryPresenter : InteractorToPresenterCategoryProtocol {
    func sendData(categoryResult:[CategoryResult]) {
        categories = categoryResult
        view?.reloadCategoryTableView()
    }
}
