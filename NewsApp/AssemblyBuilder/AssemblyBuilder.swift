//
//  AssemblyBuilder.swift
//  NewsApp
//
//  Created by IOS-Developer on 23.02.2021.
//  Copyright © 2021 IOS-Developer. All rights reserved.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol {
    func createNewsModule(router: RouterProtocol) -> UIViewController
    func createDetailsNewsModule(news: Results?, router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    func createNewsModule(router: RouterProtocol) -> UIViewController {
        let view = NewsViewController()
        let networkService = NetworkService()
        let presenter = NewsPresenter(view: view,
                                      networkService: networkService,
                                      router: router)
        view.presenter = presenter
         
        return view
    }
    
    func createDetailsNewsModule(news: Results?, router: RouterProtocol) -> UIViewController {
        let view = DetailNewsViewController()
        let networkService = NetworkService()
        let presenter = DetailNewsPresenter(view: view,
                                            networkService: networkService,
                                            router: router,
                                            news: news)
        view.presenter = presenter
        return view
    }
}
