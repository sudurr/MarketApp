//
//  MainController.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import UIKit

final class MainController: UIViewController, MainControllerProtocol {

    var presenter: MainPresenterProtocol?

    var mainView: MainViewProtocol = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    fileprivate func configure() {
        view.addSubview(mainView)
        mainView.delegate = self
        view.backgroundColor = .systemGreen
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])

        mainView.setTitle(presenter?.getMainTitle() ?? "")
        mainView.setTitleForButton(presenter?.getShowAllCardsButtonTitle() ?? "")
        mainView.setIconImage(UIImage(named: presenter?.getIconImageName() ?? ""))
    }

}

extension MainController: MainViewDelegate {

    func showAllCardsButtonPressed() {
        presenter?.showAllCardsButtonPressed()
    }

}
