//
//  AllCardsView.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 19.01.2024.
//


import UIKit

final class AllCardsView: UIView, AllCardsViewProtocol {

    func updateView() {
            collectionView.reloadData()
        }

    var delegate: AllCardsViewDelegate?

    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])

    }

    fileprivate func configureViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
    }

}

extension AllCardsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getItemsCount() ?? 0
    }



    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellData = delegate?.getCardData(at: indexPath.row),
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as? CardCell else { print("ERROR:ReusableCell"); return UICollectionViewCell() }

        cell.configure(title: cellData.title,
                       description: cellData.description,
                       image: cellData.image ?? "")

        if let categoryIcon = cellData.image {
            NetworkManager.shared.loadImage(from: categoryIcon) { result in
                switch result {
                case .success(let image):
                    cell.cardImage.image = image
                case .failure(let error):
                    print("Failed to load icon: \(error)")
                }
            }
        } else {
            cell.cardImage.image = UIImage(named: Resources.AllCardsScreen.emptyImageName)
        }
        return cell
    }
}



extension AllCardsView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectCard(at: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: frame.width * 0.437, height: frame.width * 0.789)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
             delegate?.hideNavBar() } else { delegate?.showNavBar() }
     }

}
