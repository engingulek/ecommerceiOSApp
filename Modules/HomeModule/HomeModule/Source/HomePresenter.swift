//
//  HomePresenter.swift
//  HomeModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import UICommonKit

final class HomePresenter : ViewToPresenterHomeProtocol {
    
    weak var view : PresenterToViewHomeProtocol?
    private let router : PresenterToRouterHomeProtocol
    init(view: PresenterToViewHomeProtocol,router:PresenterToRouterHomeProtocol = HomeRouter()) {
        self.view = view
        self.router = router
    }
    
   
}


extension HomePresenter {
    
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.prepareSearchBar()
        view?.searchTextFieldPlaceholder(placeholder: TextTheme.searchPlaceholder.rawValue)
        view?.prepareCollectionView()
        view?.reloadCollectionView()
        view?.changeTitle(title: TextTheme.homePage.rawValue)
    }
    
    func searchTextFieldDidChange(text: String?) {
        print(text ?? "")
    }
    
    func categoriesButtonOnTapped() {
        router.toCategoryModule(view: view)
    }
    
 
}
