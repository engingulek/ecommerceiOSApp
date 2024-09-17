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
    
    init(view: PresenterToViewCategoryProtocol?) {
        self.view = view
    }
    
    
}



extension CategoryPresenter : ViewToPresenterCategoryProtocol {

   
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.prepareCollectionView()
        view?.prepareTableView()
        view?.reloadCategoryTableView()
        view?.reloadSubCategoryCollectionView()
    }
    
    
    func numberOfRowsInSection() -> Int {
        return 10
    }
    
}
