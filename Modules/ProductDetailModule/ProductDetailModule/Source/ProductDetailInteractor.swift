//
//  ProductDetailInteractor.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import NetworkKit

final class ProductDetailInteractor : PresenterToInteractorProductDetailProtocol {
    var presenter : InteractorToPresenterProductDetailProtocol?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
}
