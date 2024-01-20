//
//  CardDetailViewProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import UIKit

protocol CardDetailViewProtocol: UIView, AnyObject {
    var dataSource: CardDetailViewDataSource? { get set }
}

protocol CardDetailViewDataSource: AnyObject {

}
