//
//  Models.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 18.01.2024.
//

import Foundation

struct Resources {

    static var cardsLimit: Int = 6

    enum MainScreen {
        static var mainTitle: String = "Добро пожаловать"
        static var iconImageName: String = "welcome_icon"
        static var showAllCardsButtonTitle: String = "Препараты"
    }

    enum AllCardsScreen {
        static var navigationTitle: String = "Список"
        static var emptyImageName: String = "empty_image"
    }

    enum CardView {
            static var buyButtonImageName: String = "location_icon"
            static var favoritesButtonImageName: String = "favorites_image"
        }
}

