//
//  HomeViewController.swift
//  HomeModule
//
//  Created by Engin Gülek on 16.09.2024.
//

import UIKit
import ViewControllerAbleKit

class HomeViewController: UIViewController {
    lazy var presenter: ViewToPresenterHomeProtocol = HomePresenter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}


extension HomeViewController : PresenterToViewHomeProtocol {
    
}
