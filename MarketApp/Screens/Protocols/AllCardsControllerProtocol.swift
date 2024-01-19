//
//  AllCardsControllerProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//


import UIKit

protocol AllCardsControllerProtocol: AnyObject {
    var allCardsView: AllCardsViewProtocol { get }
    var presenter: AllCardsPresenterProtocol? { get set }

}
