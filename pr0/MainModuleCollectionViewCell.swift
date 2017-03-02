//
//  MainModuleCollectionViewCell.swift
//  pr0
//
//  Created by Spykea on 01/03/2017.
//  Copyright © 2017 pr0gramm. All rights reserved.
//

import UIKit
import Material
import AlamofireImage

class MainModuleCollectionViewCell: CollectionViewCell {

    // MARK: - Properties

    @IBOutlet weak var itemImageView: UIImageView!

    var currentItem: Item?

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    // MARK: - UI setup

    fileprivate func setupUI() {
        backgroundColor = Colors.backgroundColor
    }

    func setup(withItem item: Item) {
        currentItem = item

        itemImageView.af_cancelImageRequest()
        itemImageView.image = nil

        let urlString = "\(APIRequests.thumbUrl)/\(item.thumb ?? "")"
        if let url = URL(string: urlString) {
            itemImageView.af_setImage(withURL: url)
        }
    }
}
