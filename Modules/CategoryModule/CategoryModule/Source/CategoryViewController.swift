//
//  CategoryViewController.swift
//  CategoryModule
//
//  Created by Engin Gülek on 16.09.2024.
//

import UIKit

class CategoryViewController: UIViewController {
    lazy var presenter : ViewToPresenterCategoryProtocol = CategoryPresenter(view: self)
    
    private lazy var categoryTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTVC.self, forCellReuseIdentifier: CategoryTVC.identifier)
        tableView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureUI()
    }

    
    //MARK: ConfigureUI
    private func configureUI() {
        view.addSubview(categoryTableView)
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width / 3)
        }
    }
}


//MARK: PresenterToViewCategoryProtocol
extension CategoryViewController : PresenterToViewCategoryProtocol {

    
    func prepareTableView() {
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
    }
   
    func prepareCollectionView() {
        
    }
    
    func reloadSubCategoryCollectionView() {
        
    }
    
    
    func reloadCategoryTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            categoryTableView.reloadData()
        }
    }
    
}


extension CategoryViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CategoryTVC.identifier,
            for: indexPath) as? CategoryTVC else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.setData()
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
