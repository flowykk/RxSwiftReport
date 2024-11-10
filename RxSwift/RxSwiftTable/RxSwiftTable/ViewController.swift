//
//  ViewController.swift
//  RxSwiftTable
//
//  Created by Данила Рахманов on 05.11.2024.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private var viewModel = ViewModel()
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        bindTableData()
    }
    
    func bindTableData() {
        viewModel.items.bind(
            to: tableView.rx.items(
                cellIdentifier: "cell",
                cellType: UITableViewCell.self
            )
        ) { row, article, cell in
            cell.textLabel?.text = article.description
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Article.self).bind { article in
            // .. -> router.navigate -> ..
            print(article.author!)
            print(article.title!)
            print(article.description!)
            print()
        }.disposed(by: bag)
        
        viewModel.fetchArticles()
    }
}

extension ViewController {
    private func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
}
