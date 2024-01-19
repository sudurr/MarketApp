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
}
