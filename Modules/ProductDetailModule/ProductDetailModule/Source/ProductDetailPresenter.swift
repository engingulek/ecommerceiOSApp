//
//  ProductDetailPresenter.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import UICommonKit
final class ProductDetailPresenter {
    weak var view : PresenterToViewProductDetailProtocol?
    private let interactor : PresenterToInteractorProductDetailProtocol
    private let router : PresenterToRouserProductDetailProtocol
    
    private var colorsList : [ColorResult] = []
    private var memorySizesList : [MemorySizeResult] = []
    init(view: PresenterToViewProductDetailProtocol?, interactor: PresenterToInteractorProductDetailProtocol = ProductDetailInteractor(), router: PresenterToRouserProductDetailProtocol = ProductDetailRouter()) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}


extension ProductDetailPresenter : ViewToPresenterProductDetailProtocol {
 
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        getFeatures()
        view?.prepareCollectionView()
        view?.reloadCollectionView()
     
        
    }
    
    func getFeatures() {
        Task {
           await interactor.fetchColor()
            await interactor.fetchMemorySize()
            view?.reloadCollectionView()
        }
    }
    
    func getProductInfo(id: Int, product_id: Int) {
        print("\(id) - \(product_id)")
    }
    
    func numberOfItemsInSection(tag: Int) -> Int {
        switch tag {
        case 0:
            return 3
        case 1:
            return memorySizesList.count
        case 2:
            return colorsList.count
        default:
            return 0
        }
    }
    
    func collectionViewCellForItem(at indexPath: IndexPath,tag:Int) -> (text: String, ()) {
        switch tag {
        case 0 :
            return ("",())
        case 1:
            let size = memorySizesList[indexPath.item].size
            return (size,())
        case 2:
            let color = colorsList[indexPath.item].name
            return (color,())
        default:
            return ("",())
        }
    }
    
  
    
    
}

extension ProductDetailPresenter : InteractorToPresenterProductDetailProtocol {
    func sendColor(colors: [ColorResult]) {
        colorsList = colors
    }
    
    func sendMemorySize(memorySizes: [MemorySizeResult]) {
        memorySizesList = memorySizes
    }
    
    
    
    
}
