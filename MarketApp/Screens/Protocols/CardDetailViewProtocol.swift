//
//  CardDetailViewProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import UIKit

protocol CardDetailViewProtocol: UIView, AnyObject {
    var dataSource: CardDetailViewDataSource? { get set }
    func setCompanyIcon(image: UIImage)
    func setCardImage(_ image: UIImage)
    func setCardTitle(_ text: String)
    func setCardDescription(_ text: String)
}

protocol CardDetailViewDataSource: AnyObject {

}
