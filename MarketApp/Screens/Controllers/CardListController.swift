//
//  AllCardsController.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//

import UIKit

final class CardListController: UIViewController, CardListControllerProtocol {
    var presenter: CardListPresenterProtocol?
    var cardListView: CardListViewProtocol = {
        let view = CardListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var titleView: UILabel = {
        let label = UILabel()
        label.text = "Список"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let searchBar = UISearchBar()
    private let expandableView = ExpandableView()
    private var leftConstraint: NSLayoutConstraint!
    private let network = NetworkManager.shared
    private var searchTask: DispatchWorkItem?

    private var cards = Cards()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadCards(from: 0)
    }

    func loadCards(from offset: Int) {
        presenter?.getCardsBy(offset: offset)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    fileprivate func colorizeNavBar(_ condition: Bool) {
        navigationController?.navigationBar.topItem?.title = " "
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = condition ? [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ] : nil
    }

    fileprivate func configureExpandableView() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        expandableView.addSubview(searchBar)
        leftConstraint = searchBar.leftAnchor.constraint(equalTo: expandableView.leftAnchor)
        leftConstraint.isActive = false
        searchBar.rightAnchor.constraint(equalTo: expandableView.rightAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: expandableView.topAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: expandableView.bottomAnchor).isActive = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(toggleSearch))
    }

    fileprivate func configure() {
        view.backgroundColor = .systemGreen
        title = presenter?.getNavigationTitle()
        cardListView.delegate = self
        searchBar.delegate = self
        view.addSubview(cardListView)
        configureExpandableView()

        NSLayoutConstraint.activate([
            cardListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardListView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            cardListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardListView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    @objc func toggleSearch() {

        navigationItem.titleView = expandableView
        navigationItem.titleView?.layoutIfNeeded()
        let isOpen = leftConstraint.isActive == true
        leftConstraint.isActive = isOpen ? false : true

        UIView.animate(withDuration: 1, animations: {
            self.navigationItem.titleView?.alpha = isOpen ? 0 : 1
            self.navigationItem.titleView?.layoutIfNeeded()
        })

        if isOpen { navigationItem.titleView = nil }
    }
}

// MARK: - CardListViewDelegate
extension CardListController: CardListViewDelegate {
    func selectCard(at index: Int) {
        presenter?.selectCard(at: index)
        showNavBar()
        navigationItem.titleView = nil
    }

    func getItemsCount() -> Int {
        presenter?.getItemsCount() ?? 0
    }

    func getCardData(at index: Int) -> CardData {
        let title = presenter?.getCardName(at: index) ?? ""
        let description = presenter?.getCardDescription(at: index) ?? ""
        let imageUrl = presenter?.getCardImageName(at: index) ?? ""
        return (title, description, imageUrl)
    }

    func hideNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func showNavBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - SearchBarDelegate

extension CardListController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchTask?.cancel()
        searchBar.resignFirstResponder()

        let task = DispatchWorkItem { [self] in
            guard let searchQuery = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
            presenter?.searchCards(query: searchQuery)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
        searchTask = task
    }
}
