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
    
    private func invetoryCheckForColorId(colorId:Int,memorySizeId:Int) -> Int {
       let stock = productInventoryResult.filter {
           $0.color_id == colorId
           && 
           $0.memory_size_id == memorySizeId }.first?.stock_quantity ?? 0
        
        return stock
    }
    
    private func invetoryCheckForMemorySize(memorySizeId:Int) -> Int {
       let stocks = productInventoryResult.filter {$0.memory_size_id == memorySizeId }
        let stockQuantity = stocks.reduce(0) { $0 + $1.stock_quantity }
        return stockQuantity
    }

}


extension ProductDetailPresenter : ViewToPresenterProductDetailProtocol {
   
 
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        getFeatures()
        view?.prepareCollectionView()
        view?.reloadCollectionView()
        view?.changeTitle(title: TextTheme.productDetail.rawValue)
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
    
    
    func collectionViewCellForItem(at indexPath: IndexPath,tag:Int) -> (text: String, 
                                                                        textColor:String,
                                                                        backColor:String,
                                                                        borderColor:String,
                                                                        multiplyIconIsHidden:Bool) {
        switch tag {
        case 0 :
            //TODO: error image url will be added there
            let imageUrl = prodcutDetailResult?.imageurl[indexPath.item] ?? ""
            return (imageUrl,"","","",true)
        case 1:
            let memorySize = memorySizesList[indexPath.item]
            let size = memorySize.size
            let id = memorySize.id
            
            let text:String
            let backColor:String
            let borderColor:String
            let textColor:String
            let multiplyIconIsHidden:Bool
            
            text = size == "1000" ? "1GB" : "\(size)GB"
            
            
            
            let stock = invetoryCheckForMemorySize(memorySizeId: id)
            
            if stock  == 0{
                textColor = ColorTheme.secandaryLabelColor.rawValue
                borderColor = ColorTheme.secandaryLabelColor.rawValue
                backColor = ColorTheme.secondaryBackColor.rawValue
                multiplyIconIsHidden = false
                
            }else{
                if selectedMemorySizeId == id {
                    textColor = ColorTheme.primaryBackColor.rawValue
                    borderColor = ColorTheme.thirdLabelColor.rawValue
                    backColor = ColorTheme.lightOrange.rawValue
                    multiplyIconIsHidden = true
                    
                    
                }else{
                    textColor = ColorTheme.secandaryLabelColor.rawValue
                    borderColor = ColorTheme.secandaryLabelColor.rawValue
                    backColor = ColorTheme.primaryBackColor.rawValue
                    multiplyIconIsHidden = true
                    
                }
            }

            return (text,textColor,backColor,borderColor,multiplyIconIsHidden)
        case 2:
            let color = colorsList[indexPath.item].name
            let id =  colorsList[indexPath.item].id
            let text:String
            let backColor:String
            let borderColor:String
            let textColor:String
            let multiplyIconIsHidden:Bool
            
            text = color
           let stok = invetoryCheckForColorId(colorId: id, memorySizeId: selectedMemorySizeId!)
            
            if stok == 0{
                textColor = ColorTheme.secandaryLabelColor.rawValue
                borderColor = ColorTheme.secandaryLabelColor.rawValue
                backColor = ColorTheme.secondaryBackColor.rawValue
                multiplyIconIsHidden = false
            }else{
                if selectedColorId == id {
                    textColor = ColorTheme.primaryBackColor.rawValue
                    borderColor = ColorTheme.thirdLabelColor.rawValue
                    backColor = ColorTheme.lightOrange.rawValue
                    multiplyIconIsHidden = true
                    
                }else{
                    textColor = ColorTheme.secandaryLabelColor.rawValue
                    borderColor = ColorTheme.secandaryLabelColor.rawValue
                    backColor = ColorTheme.primaryBackColor.rawValue
                    multiplyIconIsHidden = true
                }
            }
          
            
            return (text,textColor,backColor,borderColor,multiplyIconIsHidden)
        default:
            return ("","","","",true)
        }
    }
    
   /* // This was made this func to show the change
    func didSelectItem(at indexPath: IndexPath,tag:Int) {
        switch tag {
        case 1:
            selectedMemorySizeId = memorySizesList[indexPath.item].id
            let inventoryResults = productInventoryResult.filter { $0.memory_size_id == selectedMemorySizeId }
            let inventoryResult = inventoryResults.first(where: {$0.stock_quantity > 0})
            selectedColorId = inventoryResult?.color_id
            view?.reloadCollectionView()
        default:
            return
        }
    }*/
    
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
        let totalQuantity = invetoryCheckForMemorySize(memorySizeId: selectedMemorySizeId!)
        let alertLabelText = totalQuantity == 0 ? TextTheme.nonProductMessage.rawValue : ""
        view?.alertLabelSetText(text: alertLabelText)
    }
    
  
    
    
}
