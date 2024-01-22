//
//  CardDetailController.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//


import UIKit

final class CardDetailController: UIViewController, CardDetailControllerProtocol {

    var presenter: CardDetailPresenterProtocol?

    var cardDetailView: CardDetailViewProtocol = {
        let view = CardDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter?.loadItem()
    }

    fileprivate func configure() {
        view.addSubview(cardDetailView)

        view.backgroundColor = .systemGreen
        navigationController?.navigationBar.tintColor = .white
        NSLayoutConstraint.activate([
            cardDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
