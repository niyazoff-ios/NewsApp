//
//  NewsModel.swift
//  NewsApp
//
//  Created by IOS-Developer on 21.02.2021.
//  Copyright © 2021 IOS-Developer. All rights reserved.
//

import Foundation

struct NewsModel: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let title: String
    let url: String
}
