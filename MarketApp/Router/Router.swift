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
}



protocol RouterProtocol: AnyObject {
    func prepareInitialScreen() -> UIViewController
}
