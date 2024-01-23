//
//  AllCardsViewProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//


import UIKit

protocol AllCardsViewProtocol: UIView {
    var delegate: AllCardsViewDelegate? { get set }
    func updateView(at indexPaths: [IndexPath])
}
