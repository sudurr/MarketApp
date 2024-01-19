//
//  MainViewControllerProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 18.01.2024.
//

import UIKit

protocol MainViewProtocol: UIView {
    var titlelabel: UILabel { get }
    var iconImage: UIImageView { get }
    var showAllCardsButton: UIButton { get }
    var delegate: MainViewDelegate? { get set }

    func setTitle(_ title: String?)
    func setIconImage(_ image: UIImage?)
    func setTitleForButton(_ title: String?)
}
