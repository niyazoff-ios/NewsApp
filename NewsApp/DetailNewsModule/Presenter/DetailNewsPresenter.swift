//
//  DetailNewsPresenter.swift
//  NewsApp
//
//  Created by IOS-Developer on 25.02.2021.
//  Copyright © 2021 IOS-Developer. All rights reserved.
//

import Foundation
protocol DetailNewsViewProtocol: class {
    func setNews(news: Results?)
}

protocol DetailNewsPresenterProtocol: class {
    init(view: DetailNewsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, news: Results?)
    var news: Results? { get set }
    func setNews()
}

class DetailNewsPresenter: DetailNewsPresenterProtocol {
    weak var view: DetailNewsViewProtocol?
    let networkService: NetworkServiceProtocol!
    let router: RouterProtocol!
    var news: Results?
    
    required init(view: DetailNewsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, news: Results?) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.news = news
    }
    
    func setNews() {
        self.view?.setNews(news: news)
    }
}
