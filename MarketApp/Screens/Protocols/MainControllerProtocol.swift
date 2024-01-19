//
//  MainControllerProtocol.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//


import UIKit

protocol MainControllerProtocol: AnyObject {
    var mainView: MainViewProtocol { get }
    var presenter: MainPresenterProtocol? { get set }
}
