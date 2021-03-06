//
//  Router.swift
//  NewsApp
//
//  Created by IOS-Developer on 23.02.2021.
//  Copyright © 2021 IOS-Developer. All rights reserved.
//

import Foundation
import UIKit

protocol RouterNews {
    var navController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterNews {
    func initialViewController()
    func showDetailNews(news: Results?)
}

class Router: RouterProtocol {
   
    var navController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navController = navController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navController {
            guard let newsViewController = assemblyBuilder?.createNewsModule(router: self) else { return }
            navigationController.viewControllers = [newsViewController]
        }
    }
    
    func showDetailNews(news: Results?) {
        if let navigationController = navController {
            guard let detailNewsViewController = assemblyBuilder?
                    .createDetailsNewsModule(news: news, router: self) else { return }
            
            navigationController.pushViewController(detailNewsViewController, animated: true)
        }
    }
}
