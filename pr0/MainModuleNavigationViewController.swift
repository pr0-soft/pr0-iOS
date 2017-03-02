//
//  MainModuleNavigationViewController.swift
//  pr0
//
//  Created by Spykea on 01/03/2017.
//  Copyright © 2017 pr0gramm. All rights reserved.
//

import UIKit
import Material

class MainModuleNavigationViewController: NavigationController {

    // MARK: - Properties

    fileprivate var internalTabType: PostTabType = .new

    var tabType: PostTabType {
        get {
            return internalTabType
        }
        set {
            internalTabType = newValue
            prepareTabBarItem()
        }
    }

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        prepareTabBarItem()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UI setup

    private func prepareTabBarItem() {
        tabBarItem.title = nil
        let name = tabType == .top ? "ic_star" : "ic_fiber_new"
        let image = UIImage(named: name)?.withRenderingMode(.alwaysTemplate)
        tabBarItem.image = image?.tint(with: Colors.darkDividerColor)
        tabBarItem.selectedImage = image?.tint(with: Colors.primaryColor)
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

enum PostTabType {
    case new, top

    func string() -> String {
        switch self {
        case .new:
            return "New"
        case .top:
            return "Top"
        }
    }
}
