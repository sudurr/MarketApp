//
//  AllCardsViewProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import UIKit

protocol CardListViewProtocol: UIView {
    var delegate: CardListViewDelegate? { get set }
    var activityIndicator: UIActivityIndicatorView { get }
    func updateView(at indexPaths: [IndexPath])
    func updateView()
}
