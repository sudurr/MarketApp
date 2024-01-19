//
//  AllCardsController.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import UIKit

final class AllCardsController: UIViewController, AllCardsControllerProtocol {
    var presenter: AllCardsPresenterProtocol?
    var allCardsView: AllCardsViewProtocol = {
        let view = AllCardsView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    fileprivate func configure() {
        view.backgroundColor = .white
    }
}
