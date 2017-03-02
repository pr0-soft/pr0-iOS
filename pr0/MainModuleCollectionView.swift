//
//  MainModuleCollectionView.swift
//  pr0
//
//  Created by Spykea on 01/03/2017.
//  Copyright © 2017 pr0gramm. All rights reserved.
//

import UIKit
import Material

private let reuseIdentifier = "mainModuleCell"

class MainModuleCollectionView: CollectionView {

    // MARK: - Properties

    var rows: [Item] = []

    var scrolledToBottom: ((_ items: [Item], _ completion: (() -> Void)?) -> Void)?

    fileprivate var loadingItems = false

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    // MARK: - UI setup

    fileprivate func setupUI() {
        // delegate = self
        dataSource = self

        delegate = self

        let layout = UICollectionViewFlowLayout()
        let width = Screen.width / 3 - 8
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        collectionViewLayout = layout
    }
}

extension MainModuleCollectionView: UICollectionViewDataSource {

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rows.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MainModuleCollectionViewCell

        let row = rows[indexPath.row]

        cell.backgroundColor = getRandomColor()

        cell.setup(withItem: row)

        // Configure the cell

        return cell
    }

    func getRandomColor() -> UIColor {

        let randomRed: CGFloat = CGFloat(drand48())

        let randomGreen: CGFloat = CGFloat(drand48())

        let randomBlue: CGFloat = CGFloat(drand48())

        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}

extension MainModuleCollectionView: CollectionViewDelegate {

    // MARK: - ScrollView delegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            if !loadingItems {
                print("Scrolled...")
                loadingItems = true
                scrolledToBottom?(rows) {
                    self.loadingItems = false
                }
            }
        }
    }
}
