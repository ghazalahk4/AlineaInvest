//
//  ExploreCategoryModel.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

internal let categories = [ExploreCategoryModel(title: "Stocks",
                                                backgroundColor: UIColor(red: 162.0/255.0, green: 166.0/255.0, blue: 246.0/255.0, alpha: 1.0),
                                                iconUrl: "crypto"),
                           ExploreCategoryModel(title: "ETFs",
                                                backgroundColor: UIColor(red: 74.0/255.0, green: 83.0/255.0, blue: 199.0/255.0, alpha: 1.0),
                                                iconUrl: "etf"),
                           ExploreCategoryModel(title: "Crypto",
                                                backgroundColor: UIColor(red: 249.0/255.0, green: 215.0/255.0, blue: 92.0/255.0, alpha: 1.0),
                                                iconUrl: "stocks")]

internal struct ExploreCategoryModel {
    internal let title: String
    internal let backgroundColor: UIColor
    internal let iconUrl: String?
}
