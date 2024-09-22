//
//  HomeViewController.swift
//  HomeModule
//
//  Created by Engin Gülek on 16.09.2024.
//

import UIKit
import ViewControllerAbleKit
import SnapKit
import UICommonKit
class HomeViewController: UIViewController {
    lazy var presenter: ViewToPresenterHomeProtocol = HomePresenter(view: self)
    
    private lazy var categoryButton : UIButton = {
        let button = UIButton()
        button.setTitle(TextTheme.categories.rawValue, for: .normal)
        button.setTitleColor(UIColor(hex: ColorTheme.thirdLabelColor.rawValue) ,for: .normal)
        button.layer.cornerRadius =  RadiusTheme.small.rawValue
        button.addAction(categoryButtonAction, for: .touchUpInside)
        button.titleLabel?.font = FontTheme.font.primaryFontBoldVersion
        button.layer.borderColor = UIColor(hex: ColorTheme.thirdLabelColor.rawValue)?.cgColor
        button.layer.borderWidth = CornerWidthTheme.small.rawValue
        return button
        
    }()
    
    private lazy var lastViewedUILabel : UILabel = {
        let label = UILabel()
        label.text = TextTheme.lastViewed.rawValue
        label.textColor = UIColor(hex: ColorTheme.secandaryLabelColor.rawValue)
        label.font = FontTheme.font.primaryFontBoldVersion
        return label
        
    }()
    
    private lazy var categoryButtonAction  :UIAction = UIAction { _ in
        self.presenter.categoriesButtonOnTapped()
        
    }
    
    private lazy var lastViewedUICollectionView = UICollectionView.createCollectionView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureUI()
    }

    private func configureUI(){
        
        
        view.addSubview(categoryButton)
        categoryButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
        }
        
        view.addSubview(lastViewedUILabel)
        lastViewedUILabel.snp.makeConstraints { make in
            make.top.equalTo(categoryButton.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(lastViewedUICollectionView)
        lastViewedUICollectionView.snp.makeConstraints { make in
            make.top.equalTo(lastViewedUILabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: PresenterToViewHomeProtocol
extension HomeViewController : PresenterToViewHomeProtocol {
    
    func prepareCollectionView() {
        lastViewedUICollectionView.delegate = self
        lastViewedUICollectionView.dataSource = self
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            lastViewedUICollectionView.reloadData()
        }
    }
}


extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVC.identifier.self, for: indexPath) as? ProductCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.lastViewedUICollectionView.frame.size.width
        let cellWidth = (width-30) / 2
        return CGSize(width: cellWidth, height: cellWidth)
        
    }
}
