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
    
    init(view: PresenterToViewHomeProtocol) {
        self.view = view
    }
    
   
}


extension HomePresenter {
    
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.prepareSearchBar()
        view?.searchTextFieldPlaceholder(placeholder: TextTheme.searchPlaceholder.rawValue)
    }
    
    func searchTextFieldDidChange(text: String?) {
        print(text ?? "")
    }
}
