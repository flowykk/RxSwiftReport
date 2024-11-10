//
//  ViewController.swift
//  RxSwiftTextField
//
//  Created by Данила Рахманов on 05.11.2024.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let textField = UITextField()
    
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        bindData()
    }
}

extension ViewController {
    private func bindData() {
        textField.rx.text.orEmpty
            .bind(to: titleLabel.rx.text)
            .disposed(by: bag)
    }
}

extension ViewController {
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureTitleLabel()
        configureTextField()
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "RxSwift"
        titleLabel.font = .systemFont(ofSize: .init(30), weight: .bold)
        titleLabel.numberOfLines = 5
        
        view.addSubview(titleLabel)
        titleLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 10)
        titleLabel.pinHorizontal(to: view, 10)
    }
    
    private func configureTextField() {
        textField.placeholder = "Your text"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.textAlignment = .left
        
        view.addSubview(textField)
        textField.pinCenterY(to: view)
        textField.pinHorizontal(to: view, 10)
        textField.setHeight(50)
    }
}
