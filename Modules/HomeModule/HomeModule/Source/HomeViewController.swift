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
    
    private lazy var searchTextField = UISearchTextField()
    private lazy var categoryButton : UIButton = {
       let button = UIButton()
        button.setTitle(TextTheme.categories.rawValue, for: .normal)
        button.setTitleColor(UIColor(hex: ColorTheme.secandaryLabelColor.rawValue) ,for: .normal)
        button.layer.cornerRadius =  RadiusTheme.small.rawValue
        button.addAction(categoryButtonAction, for: .touchUpInside)
        button.titleLabel?.font = FontTheme.font.primaryFontBoldVersion
        button.layer.borderColor = UIColor(hex: ColorTheme.secandaryLabelColor.rawValue)?.cgColor
        button.layer.borderWidth = CornerWidthTheme.small.rawValue
        return button
        
    }()
    
    private lazy var categoryButtonAction  :UIAction = UIAction { _ in
        print("to categories page")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureUI()
        
        //TODO: Look at the best of this
        searchTextField.addTarget(self,
                                  action: #selector(searchTextFieldDidChange(_:)),
                                  for: .editingChanged)
    }
    
    @objc func searchTextFieldDidChange(_ textField: UITextField){
        presenter.searchTextFieldDidChange(text: textField.text)
    }
    
    private func configureUI(){
      
        view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(45)
        }
        view.addSubview(categoryButton)
        categoryButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
        }
    }
}

//MARK: PresenterToViewHomeProtocol
extension HomeViewController : PresenterToViewHomeProtocol {
  
    
    func prepareSearchBar() {
        searchTextField.delegate = self
    }
    
    func searchTextFieldPlaceholder(placeholder: String) {
        searchTextField.placeholder = placeholder
    }
    
    
}

//MARK: UITextFieldDelegate
extension HomeViewController : UITextFieldDelegate  {
    func textField(_ textField: UITextField, 
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let currentText = textField.text
        presenter.searchTextFieldDidChange(text:currentText)
        return true
    }
}
