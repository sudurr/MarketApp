//
//  CardDetailControllerProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import UIKit

protocol CardDetailControllerProtocol: AnyObject {
    var cardDetailView: CardDetailViewProtocol { get }
    var presenter: CardDetailPresenterProtocol? { get set }
}
