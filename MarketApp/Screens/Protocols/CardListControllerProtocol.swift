//
//  AllCardsControllerProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import UIKit

protocol CardListControllerProtocol: AnyObject {
    var cardListView: CardListViewProtocol { get }
    var presenter: CardListPresenterProtocol? { get set }
}
