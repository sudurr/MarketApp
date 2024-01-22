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
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 16
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
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .gray
        button.setImage(UIImage(named: Resources.CardView.favoritesButtonImageName)?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    private let cardTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let cardDescription: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitle(" Где купить".uppercased(), for: .normal)
        button.setImage(UIImage(named:Resources.CardView.buyButtonImageName)?.withRenderingMode(.alwaysOriginal),
                        for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor( red: 230/255, green: 230/255, blue:230/255, alpha: 1.0 ).cgColor
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
        configureViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutViews()
        configureViews()
    }

    fileprivate func layoutViews() {
        addSubview(mainStackView)

        topStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            iconImage.widthAnchor.constraint(equalToConstant: 32),
            iconImage.heightAnchor.constraint(equalToConstant: 32),
            favoritesButton.widthAnchor.constraint(equalToConstant: 32),
            favoritesButton.heightAnchor.constraint(equalToConstant: 32),

            cardImage.widthAnchor.constraint(equalToConstant: 150),
            cardImage.heightAnchor.constraint(equalToConstant: 200),

            buyButton.heightAnchor.constraint(equalToConstant: 40),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }

    fileprivate func configureViews() {
        backgroundColor = .white

        topStackView.addArrangedSubview(iconImage)
        topStackView.spacing = 20
        topStackView.addArrangedSubview(cardImage)
        topStackView.spacing = 20
        topStackView.addArrangedSubview(favoritesButton)

        let spacerView = UIView()
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(cardTitle)
        mainStackView.addArrangedSubview(cardDescription)
        mainStackView.addArrangedSubview(buyButton)
        mainStackView.addArrangedSubview(spacerView)

        iconImage.setContentCompressionResistancePriority(.required, for: .horizontal)
        iconImage.setContentCompressionResistancePriority(.required, for: .vertical)

        favoritesButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        favoritesButton.setContentCompressionResistancePriority(.required, for: .vertical)
        cardImage.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        cardImage.setContentCompressionResistancePriority(.defaultLow, for: .vertical)


        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 10

        topStackView.axis = .horizontal
        topStackView.alignment = .top

        topStackView.spacing = 20
        topStackView.setContentCompressionResistancePriority(.required, for: .horizontal)
        topStackView.setContentCompressionResistancePriority(.required, for: .vertical)
    }

    func setCompanyIcon(image: String) {
        NetworkManager.shared.loadImage(from: image) { [self] result in
            switch result {
            case .success(let loadedImage):
                DispatchQueue.main.async {
                    self.iconImage.image = loadedImage
                }
            case .failure(let error):
                print(error.localizedDescription) }
        }
    }

    func setCardImage(_ image: String) {
        NetworkManager.shared.loadImage(from: image) { [self] result in
            switch result {
            case .success(let loadedImage):
                DispatchQueue.main.async {
                    self.cardImage.image = loadedImage
                }
            case .failure(let error):
                print(error.localizedDescription) }
        }
    }

    func setCardTitle(_ text: String) {
        self.cardTitle.text = text
    }

    func setCardDescription(_ text: String) {
        self.cardDescription.text = text
    }
}
