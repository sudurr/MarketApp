//
//  AllCardsPresenterProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//


import Foundation

protocol AllCardsPresenterProtocol: AnyObject {
    func getNavigationTitle() -> String
    func getImageName(forCard id: Int) -> String
    func selectCard(at index: Int)

    func getCardsBy(offset: Int)
    func getItemsCount() -> Int

    func getCardName(at index: Int) -> String?
    func getCardDescription(at index: Int) -> String?
    func getCardImageName(at index: Int) -> String?

    func searchCards(query: String)

}
