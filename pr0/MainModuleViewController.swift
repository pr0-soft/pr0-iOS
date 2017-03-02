//
//  MainModuleViewController.swift
//  pr0
//
//  Created by Spykea on 01/03/2017.
//  Copyright © 2017 pr0gramm. All rights reserved.
//

import UIKit

class MainModuleViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var imageCollectionView: MainModuleCollectionView!

    fileprivate var atEnd = false

    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        loadRows()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UI setup

    fileprivate func setupUI() {
        // Background color
        view.backgroundColor = Colors.backgroundColor
        imageCollectionView?.backgroundColor = Colors.backgroundColor

        setupToolbar()

        imageCollectionView.scrolledToBottom = { items, completion in
            var older: Int?
            if items.count > 0 {
                older = items[items.count - 1].id
            }
            self.loadRows(older: older) { success, items in
                completion?()
            }
        }
    }

    fileprivate func setupToolbar() {
        navigationController?.navigationBar.backgroundColor = Colors.primaryColor

        navigationController?.navigationBar.tintColor = Colors.lightPrimaryTextColor

        navigationItem.title = (navigationController as? MainModuleNavigationViewController)?.tabType.string()

        navigationItem.titleLabel.textColor = Colors.lightPrimaryTextColor
        navigationItem.titleLabel.textAlignment = .center
    }

    // MARK: - Networking

    fileprivate func loadRows(newer: Int? = nil, older: Int? = nil, completion: ((_ success: Bool, _ items: Items?) -> Void)? = nil) {
        guard !atEnd else {
            return
        }
        let tabType = (navigationController as? MainModuleNavigationViewController)?.tabType
        APIRequests.getItems(tabType: tabType, flags: 7, newer: newer, older: older) { (success, items) in
            guard let items = items, success else {
                completion?(false, nil)
                return
            }

            if items.atEnd == true {
                self.atEnd = true
            }

            self.imageCollectionView.rows += items.items ?? []
            self.imageCollectionView.reloadData()

            completion?(true, items)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
