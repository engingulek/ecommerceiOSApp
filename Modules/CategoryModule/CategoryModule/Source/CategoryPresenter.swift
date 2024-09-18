//
//  CategoryPresenter.swift
//  CategoryModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import UICommonKit
final class CategoryPresenter  {
    weak var view: PresenterToViewCategoryProtocol?
    private let interactor : PresenterToInteractorCategoryProtocol
    private var categories: [CategoryResult] = []
    private var subCategories : [SubCategories] = []
    private var selectedCategoryId: Int = -1
    init(view: PresenterToViewCategoryProtocol?,interactor:PresenterToInteractorCategoryProtocol = CategoryInteractor()) {
        self.view = view
        self.interactor = interactor
    }
}



extension CategoryPresenter  {
    
    
    
    
    func fetch() async {
        do{
            try await interactor.fetchCategories()
        }catch{
            print("Error fetch categories")
        }
        
    }
    
}

extension CategoryPresenter : ViewToPresenterCategoryProtocol {
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.prepareCollectionView()
        view?.prepareTableView()
        view?.reloadCategoryTableView()
        view?.reloadSubCategoryCollectionView()
        view?.changeTitle(title: TextTheme.categories.rawValue)
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
                backColor = ColorTheme.lightGrayAlpha0_3.rawValue
            }
            
            return (text,textColor,backColor)
            
            
        }
    
    func didSelectRow(at indexPath: IndexPath) {
        selectedCategoryId = categories[indexPath.row].id
        view?.speacialViewChangeUI(textColor: ColorTheme.secandaryLabelColor.rawValue, backColor: "")
        view?.reloadCategoryTableView()
    }
    
    func specialViewOnTapped() {
        selectedCategoryId =  -1
        //TODO: pre-selected categories will be gone here
        subCategories = []
        view?.speacialViewChangeUI(
            textColor: ColorTheme.thirdLabelColor.rawValue,
            backColor: ColorTheme.primaryBackColor.rawValue)
        view?.reloadCategoryTableView()
    }
    
}

extension CategoryPresenter : InteractorToPresenterCategoryProtocol {
    func sendData(categoryResult:[CategoryResult]) {
        categories = categoryResult
        view?.reloadCategoryTableView()
    }
    
    
}
