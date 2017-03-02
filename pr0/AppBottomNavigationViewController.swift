//
//  AppBottomNavigationViewController.swift
//  pr0
//
//  Created by Spykea on 01/03/2017.
//  Copyright © 2017 pr0gramm. All rights reserved.
//

import UIKit
import Material

class AppBottomNavigationViewController: BottomNavigationController {

    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    open override func prepare() {
        super.prepare()
        prepareTabBar()

        if let viewControllers = viewControllers {
            if viewControllers.count > 1, let c = viewControllers[1] as? MainModuleNavigationViewController {
                c.tabType = .top
            }
        }
    }

    private func prepareTabBar() {
        tabBar.depthPreset = .none
        tabBar.dividerColor = Colors.darkDividerColor
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
