//
//  CategoryViewController.swift
//  CategoryModule
//
//  Created by Engin Gülek on 16.09.2024.
//

import UIKit
import UICommonKit
import ViewControllerAbleKit

class CategoryViewController: UIViewController {
    lazy var presenter : ViewToPresenterCategoryProtocol = CategoryPresenter(view: self)
    
    private lazy var categoryTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTVC.self, forCellReuseIdentifier: CategoryTVC.identifier)
        tableView.backgroundColor = UIColor(hex: ColorTheme.secondaryBackColor.rawValue)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var subCategoryCollectionView = UICollectionView.createCollectionView(scrollDirection: .vertical)
    
    private lazy var specialView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: ColorTheme.secondaryBackColor.rawValue)
        return view
    }()
    
    private lazy var specialIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: IconTheme.specialIcon.rawValue)
        imageView.tintColor = UIColor(hex: ColorTheme.thirdLabelColor.rawValue)
        return imageView
    }()
    
    private lazy var specialLabel : UILabel = {
        let label = UILabel()
        label.text = TextTheme.forYou.rawValue
        return label
    }()
    
    private lazy var emptyMessageLabel = UILabel.primaryUILabelLeft(color: ColorTheme.alertLabelColor.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureUI()
        subCategoryCollectionView.register(
            SubCategoryCVC.self,
            forCellWithReuseIdentifier: SubCategoryCVC.identifier)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        specialView.isUserInteractionEnabled = true
        specialView.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func viewTapped() {
        presenter.specialViewOnTapped()
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
        
        subCategoryCollectionView.addSubview(emptyMessageLabel)
        emptyMessageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
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
    
    func speacialViewChangeUI(textColor:String,backColor:String) {
        specialLabel.textColor = UIColor(hex: textColor)
        specialView.backgroundColor = UIColor(hex: backColor)
        
    }
    
    func setEmptyMessageForYou(text: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            emptyMessageLabel.text = text
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
        
        
        let cellItem = presenter.cellForItem(at: indexPath)
        cell.setData(name: cellItem.text)
        cell.setConfigureUI(color: cellItem.textColor)
        cell.selectionStyle = .none
        
        if (cellItem.backColor == "#FFFFFF") {
            cell.backgroundColor = UIColor(hex: cellItem.backColor)
        }else{
            cell.backgroundColor = .clear
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}

//MARK: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
extension CategoryViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:SubCategoryCVC.identifier.self,
                                                            for: indexPath) as? SubCategoryCVC else {
            return UICollectionViewCell()
        }
        
        let subCategory = presenter.collectionViewCellForItem(at: indexPath)
        cell.setData(subCategory: subCategory)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout, 
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        let cellWidth = (width-30) / 2
        return CGSize(width: cellWidth, height: cellWidth)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        presenter.didSelectItemAt(at: indexPath)
    }
}
