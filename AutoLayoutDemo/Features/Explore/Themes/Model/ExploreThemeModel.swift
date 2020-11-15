//
//  ExploreThemeModel.swift
//
//  Created by Ghazalah on 13/11/20.
//

import Foundation

internal let themes = [ExploreThemeModel(title: "Diversity & Inclusion",
                                             iconUrl: "diversity_inclusion"),
                           ExploreThemeModel(title: "Bold Bioteech",
                                             iconUrl: "bold_bio_tech"),
                           ExploreThemeModel(title: "Crypto Central",
                                             iconUrl: "crypto_central"),
                           ExploreThemeModel(title: "She runs it",
                                             iconUrl: "she_runs_it"),
                           ExploreThemeModel(title: "Clean & Green",
                                             iconUrl: "clean_green"),
                           ExploreThemeModel(title: "Cannabisness",
                                             iconUrl: "cannabisness"),
                           ExploreThemeModel(title: "Power it",
                                             iconUrl: "powerIt"),
                           ExploreThemeModel(title: "Foodie Fun",
                                             iconUrl: "foodie_fun"),
                           ExploreThemeModel(title: "Art & Fashion",
                                             iconUrl: "art_fashion"),
                           ExploreThemeModel(title: "Home is where heart is",
                                             iconUrl: "home")]

internal struct ExploreThemeModel {
    internal let title: String
    internal let iconUrl: String?
}
