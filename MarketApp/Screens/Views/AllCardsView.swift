//
//  AllCardsView.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//


import UIKit

final class AllCardsView: UIView, AllCardsViewProtocol {

    var delegate: AllCardsViewDelegate?

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


    }

    fileprivate func configureViews() {

    }


}
