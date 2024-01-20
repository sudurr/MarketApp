//
//  CardDetailView.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import UIKit

final class CardDetailView: UIView, CardDetailViewProtocol {
    var dataSource: CardDetailViewDataSource?

    private let topStackView = UIStackView()
    private let mainStackView = UIStackView()

    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let favoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.setImage(UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate), for: .selected)
        return button
    }()

    private let cardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let cardDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configureViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        layoutViews()
        configureViews()
    }

    fileprivate func addViews() {
        addSubview(topStackView)
        //   addSubview(mainStackView)

        topStackView.addArrangedSubview(iconImage)
        topStackView.addArrangedSubview(cardImage)
        topStackView.addArrangedSubview(favoritesButton)
        topStackView.translatesAutoresizingMaskIntoConstraints = false

        //        mainStackView.addArrangedSubview(topStackView)
        //        mainStackView.addArrangedSubview(cardTitle)
        //        mainStackView.addArrangedSubview(cardDescription)
        //        mainStackView.addArrangedSubview(buyButton)
        //        mainStackView.translatesAutoresizingMaskIntoConstraints = false
    }

    fileprivate func layoutViews() {
        NSLayoutConstraint.activate([

            iconImage.widthAnchor.constraint(equalToConstant: 32),

            cardImage.widthAnchor.constraint(equalToConstant: 150),

            favoritesButton.widthAnchor.constraint(equalToConstant: 32),

            topStackView.topAnchor.constraint(equalTo: topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topStackView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }

    fileprivate func configureViews() {
        topStackView.axis = .horizontal
        //  topStackView.distribution = .equalSpacing
        topStackView.spacing = 30
        mainStackView.axis = .vertical

        topStackView.backgroundColor = .systemGray4
        mainStackView.backgroundColor = .systemGray3

        iconImage.backgroundColor = .black
        cardImage.backgroundColor = .blue

    }
}
