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
    private var prodcutDetailResult : ProductDetailResult?
    private var productInventoryResult:[InventoryResult] = []
    private var selectedMemorySizeId: Int?
    private var selectedColorId:Int?
    init(view: PresenterToViewProductDetailProtocol?,
         interactor: PresenterToInteractorProductDetailProtocol = ProductDetailInteractor(),
         router: PresenterToRouserProductDetailProtocol = ProductDetailRouter()) {
        
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
        Task {
            await interactor.fetchProductDetail(id:id,product_id:product_id)
            await interactor.fetchInventoryInfo(product_id: product_id)
            view?.reloadCollectionView()
        }
    }
    
    func numberOfItemsInSection(tag: Int) -> Int {
        switch tag {
        case 0:
            return prodcutDetailResult?.imageurl.count ?? 0
        case 1:
            return memorySizesList.count
        case 2:
            return colorsList.count
        default:
            return 0
        }
    }
    
    //TODO: () = selected and nonselected  border color 
    func collectionViewCellForItem(at indexPath: IndexPath,tag:Int) -> (text: String, textColor:String,backColor:String,borderColor:String) {
        switch tag {
        case 0 :
            //TODO: error image url will be added there
            let imageUrl = prodcutDetailResult?.imageurl[indexPath.item] ?? ""
            return (imageUrl,"","","")
        case 1:
            let memorySize = memorySizesList[indexPath.item]
            let size = memorySize.size
            let id = memorySize.id
            
            let text:String
            let backColor:String
            let borderColor:String
            let textColor:String
            
            text = size
            
            if selectedMemorySizeId == id {
                textColor = ColorTheme.primaryBackColor.rawValue
                borderColor = ColorTheme.thirdLabelColor.rawValue
                backColor = ColorTheme.lightOrange.rawValue
                
            }else{
                textColor = ColorTheme.secandaryLabelColor.rawValue
                borderColor = ColorTheme.secandaryLabelColor.rawValue
                backColor = ColorTheme.primaryBackColor.rawValue
            }
            
            
            return (text,textColor,backColor,borderColor)
        case 2:
            let color = colorsList[indexPath.item].name
            let id =  colorsList[indexPath.item].id
            let text:String
            let backColor:String
            let borderColor:String
            let textColor:String
            
            text = color
            
            if selectedColorId == id {
                textColor = ColorTheme.primaryBackColor.rawValue
                borderColor = ColorTheme.thirdLabelColor.rawValue
                backColor = ColorTheme.lightOrange.rawValue
                
            }else{
                textColor = ColorTheme.secandaryLabelColor.rawValue
                borderColor = ColorTheme.secandaryLabelColor.rawValue
                backColor = ColorTheme.primaryBackColor.rawValue
            }
            
            return (text,textColor,backColor,borderColor)
        default:
            return ("","","","")
        }
    }
    
    func sizeForItemAt() -> CGSize {
        return CGSize(width: 80, height: 50)
    }

}

extension ProductDetailPresenter : InteractorToPresenterProductDetailProtocol {
 
    func sendColor(colors: [ColorResult]) {
        colorsList = colors
    }
    
    func sendMemorySize(memorySizes: [MemorySizeResult]) {
        memorySizesList = memorySizes
    }
    
    func sendProductDetail(productDetail:ProductDetailResult) {
        prodcutDetailResult = productDetail
        selectedMemorySizeId = productDetail.memory_size_id
        selectedColorId = productDetail.color_id
        view?.configureData(baseImageUrl: productDetail.imageurl[0],
                            name: productDetail.name,
                            price: productDetail.price,
                            desc: productDetail.description)
    }
    
    func sendInventoryResult(inventorResult: [InventoryResult]) {
        productInventoryResult =  inventorResult
    }
    
  
    
    
}
