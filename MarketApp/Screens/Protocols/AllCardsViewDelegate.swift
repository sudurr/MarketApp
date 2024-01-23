//
//  AllCardsViewDelegate.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//


import UIKit

typealias CardData = (title: String, description: String, image: String?)

protocol AllCardsViewDelegate {

    func getItemsCount() -> Int
    func getCardData(at index: Int) -> CardData
    func selectCard(at index: Int)
    func hideNavBar()
    func showNavBar()
    func loadCards(from offset: Int)
}
