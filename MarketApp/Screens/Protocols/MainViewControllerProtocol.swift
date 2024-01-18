//
//  MainViewControllerProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 18.01.2024.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    var titlelabel: UILabel { get }
    var iconImage: UIImageView { get }
    var showAllCardsButton: UIButton { get }
}
