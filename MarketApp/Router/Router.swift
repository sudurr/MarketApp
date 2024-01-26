//
//  Router.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 18.01.2024.
//

import UIKit

final class Router: RouterProtocol {

    private var navigation: UINavigationController
    init(navigation: UINavigationController = UINavigationController()) {
        self.navigation = navigation
    }

    func prepareInitialScreen() -> UIViewController {
        let mainController = MainController()
        let mainPresenter = MainPresenter(router: self, view: mainController.mainView)
        mainController.presenter = mainPresenter

        navigation.viewControllers = [mainController]
        return navigation
    }

    func openAllCardsScreen() {
        let allCardsController = AllCardsController()
        let allCardsPresenter = AllCardsPresenter(router: self, view: allCardsController.allCardsView)
        allCardsController.presenter = allCardsPresenter
        navigation.pushViewController(allCardsController, animated: true)
    }

    func openCardDetailScreen(for id: Int) {
        let cardDetailController = CardDetailController()
        let cardDetailPresenter = CardDetailPresenter(view: cardDetailController.cardDetailView, item: id)
        cardDetailController.presenter = cardDetailPresenter
        navigation.pushViewController(cardDetailController, animated: true)
    }
}

protocol RouterProtocol: AnyObject {
    func prepareInitialScreen() -> UIViewController
    func openAllCardsScreen()
    func openCardDetailScreen(for id: Int)
}
