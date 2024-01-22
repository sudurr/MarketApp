//
//  CardCell.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//


import UIKit

final class CardCell: UICollectionViewCell {

    static let identifier: String = "CardCell"

    var cardImage: UIImageView = {
       let image = UIImageView()
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let cardTitle: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let cardDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    fileprivate func layoutViews() {
        addSubview(cardImage)
        addSubview(cardTitle)
        addSubview(cardDescription)

        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            cardImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            cardImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            cardImage.heightAnchor.constraint(equalToConstant: 82),

            cardTitle.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 12),
            cardTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            cardTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),

            cardDescription.topAnchor.constraint(equalTo: cardTitle.bottomAnchor, constant: 6),
            cardDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            cardDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }

    public func configure(title: String, description: String, image: String) {
        self.backgroundColor = .clear
        self.cardTitle.text = title
        self.cardDescription.text = description

        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor( red: 230/255, green: 230/255, blue:230/255, alpha: 1.0 ).cgColor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutViews()
    }
}
