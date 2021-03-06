//
//  ViewController.swift
//  NewsApp
//
//  Created by IOS-Developer on 21.02.2021.
//  Copyright © 2021 IOS-Developer. All rights reserved.
//

import UIKit
class NewsViewController: UIViewController {

    weak var newsView: NewsViewProtocol!
    var presenter: NewsViewPresenterProtocol!
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.indentifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        navigationItem.title = "Top Stories"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.news?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.indentifier, for: indexPath) as! NewsTableViewCell
        let news = presenter.news?.results[indexPath.row]
        cell.newsTitleLabel.text = news?.title
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tapOnTheNews(results: presenter.news?.results[indexPath.row])
    }
}
extension NewsViewController: NewsViewProtocol {
    func success(news: NewsModel) {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
