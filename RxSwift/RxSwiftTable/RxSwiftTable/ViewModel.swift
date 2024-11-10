//
//  ViewModel.swift
//  RxSwiftTable
//
//  Created by Данила Рахманов on 06.11.2024.
//

import Foundation
import RxSwift

protocol ViewModelDelegate: AnyObject {
    var items: PublishSubject<[Article]> { get set }

    func fetchArticles()
}

final class ViewModel: ViewModelDelegate {
    var items = PublishSubject<[Article]>()
    
    func fetchArticles() {
        NetworkManager.shared.getArticles { result in
            switch result {
            case .success(let articles):
                self.items.onNext(articles)
                self.items.onCompleted()
            case .failure(let error):
                print(error)
            }
        }
    }
}
