//
//  NewsPresenter.swift
//  NewsApp
//
//  Created by IOS-Developer on 23.02.2021.
//  Copyright © 2021 IOS-Developer. All rights reserved.
//

import UIKit

protocol NewsViewProtocol: class {
    func success(news: NewsModel)
    func failure(error: Error)
}
protocol NewsViewPresenterProtocol: class {
    var news: NewsModel? { get set }
    init(view: NewsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func tapOnTheNews(results: Results?)
    func getNews()
}

class NewsPresenter: NewsViewPresenterProtocol {
    
    var news: NewsModel?
    weak var view: NewsViewProtocol?
    let networkService: NetworkServiceProtocol!
    let router: RouterProtocol!
   
    required init(view: NewsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getNews()
    }
    
    func getNews() {
        networkService.getNews { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let remoteNews):
                    self.news = remoteNews
                    self.view?.success(news: remoteNews)
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func tapOnTheNews(results: Results?) {
        router.showDetailNews(news: results)
    }
}
