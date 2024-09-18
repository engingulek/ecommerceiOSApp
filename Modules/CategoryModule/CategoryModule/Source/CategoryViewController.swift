//
//  CategoryViewController.swift
//  CategoryModule
//
//  Created by Engin Gülek on 16.09.2024.
//

import UIKit
import UICommonKit
class CategoryViewController: UIViewController {
    lazy var presenter : ViewToPresenterCategoryProtocol = CategoryPresenter(view: self)
    
    private lazy var categoryTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTVC.self, forCellReuseIdentifier: CategoryTVC.identifier)
        tableView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    private lazy var subCategoryCollectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       
        layout.scrollDirection = .vertical
        let  collectionview = UICollectionView(frame: .zero,
                                         collectionViewLayout: layout)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionview.register(
            SubCategoryCVC.self,
            forCellWithReuseIdentifier: SubCategoryCVC.identifier)
        
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = UIColor(hex:ColorTheme.primaryBackColor.rawValue)
        return collectionview
    }()
    
    private lazy var specialView : UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.2)
        return view
        
    }()
    
    private lazy var specialIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.circle")
        imageView.tintColor = UIColor(hex: ColorTheme.thirdLabelColor.rawValue)
        return imageView
    }()
    
    private lazy var specialLabel : UILabel = {
        let label = UILabel()
        label.text = "For You"
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureUI()
    }

    
    //MARK: ConfigureUI
    private func configureUI() {
        view.addSubview(specialView)
        specialView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(UIScreen.main.bounds.width / 3)
            make.height.equalTo(100)
            make.leading.equalToSuperview()
        }
        
        specialView.addSubview(specialIcon)
        specialIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        specialView.addSubview(specialLabel)
        specialLabel.snp.makeConstraints { make in
            make.top.equalTo(specialIcon.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(categoryTableView)
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(specialView.snp.bottom)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width / 3)
        }
        
        view.addSubview(subCategoryCollectionView)
        subCategoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(categoryTableView.snp.trailing)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
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
        subCategoryCollectionView.delegate = self
        subCategoryCollectionView.dataSource = self
    }
    
    func reloadSubCategoryCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            subCategoryCollectionView.reloadData()
        }
    }
    
    
    func reloadCategoryTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            categoryTableView.reloadData()
        }
    }
    
}

//MARK:  UITableViewDelegate,UITableViewDataSource
extension CategoryViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CategoryTVC.identifier,
            for: indexPath) as? CategoryTVC else {return UITableViewCell()}
        cell.selectionStyle = .none
        let name = presenter.cellForItem(at: indexPath)
        cell.setData(name: name)
        cell.backgroundColor = .clear
        return cell
    }
}

//MARK: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout 
extension CategoryViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:SubCategoryCVC.identifier.self, for: indexPath) as? SubCategoryCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let cellWidth = (width-30) / 2
        return CGSize(width: cellWidth, height: cellWidth)
        
    }
}
