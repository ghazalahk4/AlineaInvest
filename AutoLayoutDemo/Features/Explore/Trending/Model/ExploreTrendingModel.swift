//
//  ExploreTrendingModel.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

internal enum TrendType {
    case positive, negative
    
    internal var chipColor: UIColor {
        switch self {
        case .positive:
            return UIColor(red: 112.0/255.0, green: 216.0/255.0, blue: 181.0/255.0, alpha: 1.0)
        case .negative:
            return UIColor(red: 233.0/255.0, green: 115.0/255.0, blue: 118.0/255.0, alpha: 1.0)
        }
    }
}

internal struct ExploreTrendingModel {
    internal let brands: [BrandModel]
    internal let title: String
}

internal struct BrandModel {
    internal let title: String
    internal let subTitle: String
    internal let statusText: String
    internal let statusType: TrendType
    internal let iconUrl: String?
}


internal let trendingDataSource: [ExploreTrendingModel] = [ExploreTrendingModel(brands: topGainers, title: "Top Gainers"),
                                                           ExploreTrendingModel(brands: topSellers, title: "Top Sellers")]

internal let topGainers: [BrandModel] = [BrandModel(title: "Medifast",
                                                    subTitle: "MEDI",
                                                    statusText: "+50.78%",
                                                    statusType: .positive,
                                                    iconUrl: "medifast"),
                                         BrandModel(title: "Pinterest",
                                                    subTitle: "PINS",
                                                    statusText: "-4.77%",
                                                    statusType: .negative,
                                                    iconUrl: "pinterest"),
                                         BrandModel(title: "Slack Technologies",
                                                    subTitle: "WORK",
                                                    statusText: "-5.99%",
                                                    statusType: .negative,
                                                    iconUrl: "slack"),
                                         BrandModel(title: "Evoqua Water",
                                                    subTitle: "AQUA",
                                                    statusText: "+5.99%",
                                                    statusType: .positive,
                                                    iconUrl: "evoqua")]


internal let topSellers: [BrandModel] = [BrandModel(title: "Medicore",
                                                    subTitle: "MEDI",
                                                    statusText: "+5.78%",
                                                    statusType: .positive,
                                                    iconUrl: "medifast"),
                                         BrandModel(title: "Facebook",
                                                    subTitle: "SOCIAL MEDIA",
                                                    statusText: "+4.77%",
                                                    statusType: .positive,
                                                    iconUrl: "slack"),
                                         BrandModel(title: "Skype",
                                                    subTitle: "WORK",
                                                    statusText: "-5.99%",
                                                    statusType: .negative,
                                                    iconUrl: "slack")]
