//
//  MainPresenterProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 18.01.2024.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func getMainTitle() -> String
    func getIconImageName() -> String
    func getShowAllCardsButtonTitle() -> String

    func showAllCardsButtonPressed()
}
