//
//  AllCardsPresenter.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//


import Foundation

final class AllCardsPresenter: AllCardsPresenterProtocol {
    
    func getNavigationTitle() -> String {
        return Resources.AllCardsScreen.navigationTitle
    }

    func getImageName(forCard id: Int) -> String {
        return Resources.AllCardsScreen.emptyImageName
    }

    private var router: RouterProtocol?
    private weak var view: AllCardsViewProtocol?

    init(router: RouterProtocol, view: AllCardsViewProtocol) {
        self.view = view
        self.router = router
    }

}
