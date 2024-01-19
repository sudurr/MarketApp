//
//  MainPresenter.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 18.01.2024.
//

import Foundation

final class MainPresenter: MainPresenterProtocol {


    private var router: RouterProtocol?
    private weak var view: MainViewProtocol?

    init(router: RouterProtocol, view: MainViewProtocol) {
        self.view = view
        self.router = router
    }

    func getMainTitle() -> String {
        return Resources.MainScreen.mainTitle
    }

    func getIconImageName() -> String {
        return Resources.MainScreen.iconImageName
    }

    func getShowAllCardsButtonTitle() -> String {
        return Resources.MainScreen.showAllCardsButtonTitle
    }

    func showAllCardsButtonPressed() {
        router?.openAllCardsScreen()
    }


}
