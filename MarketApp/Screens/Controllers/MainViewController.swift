//
//  MainViewController.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 18.01.2024.
//

import UIKit

final class MainViewController: UIViewController {
    var titlelabel: UILabel = {
        let label = UILabel()

        return label
    }()

    var iconImage: UIImageView = {
        let image = UIImageView()

        return image
    }()

    var showAllCardsButton: UIButton  = {
        let button = UIButton()

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension MainViewController: MainViewControllerProtocol {



}
