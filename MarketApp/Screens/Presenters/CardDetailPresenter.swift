//
//  CardDetailPresenter.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import Foundation

final class CardDetailPresenter: CardDetailPresenterProtocol {
    private weak var view: CardDetailViewProtocol?
    private var router: RouterProtocol?

    init(router: RouterProtocol, view: CardDetailViewProtocol) {
        self.view = view
        self.router = router
    }
}
