//
//  MainView.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import UIKit

final class MainView: UIView, MainViewProtocol {

    var delegate: MainViewDelegate?

    var titlelabel: UILabel  = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var showAllCardsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen.withAlphaComponent(0.7)
        return button
    }()

    private let stackView =  UIStackView()

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

    private func layoutViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(titlelabel)
        stackView.addArrangedSubview(iconImage)
        stackView.addArrangedSubview(showAllCardsButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            showAllCardsButton.heightAnchor.constraint(equalToConstant: 60),
            showAllCardsButton.widthAnchor.constraint(equalToConstant: 180),
            titlelabel.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.2)
        ])
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

    }

    private func configureViews() {

        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 20
        iconImage.contentMode = .scaleAspectFit
        showAllCardsButton.addTarget(self, action: #selector(showButtonAction), for: .touchUpInside)

    }

    func setIconImage(_ image: UIImage?) {
        iconImage.image = image
    }

    func setTitle(_ title: String?) {
        titlelabel.text = title
    }

    func setTitleForButton(_ title: String?) {
        showAllCardsButton.setTitle(title, for: .normal)
    }

    @objc func showButtonAction() {
        delegate?.showAllCardsButtonPressed()
    }

}
