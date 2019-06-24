//
//  LaunchViewController.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/8/17.
//  Copyright © 2017 Marcelo Oscar José. All rights reserved.
//

import UIKit
import PureLayout

class LaunchViewController: BaseViewController {

    let delayPresentation = 2000
    let launchView: LaunchView = LaunchView()

    override func createViews() {
        self.view.backgroundColor = UIColor.mercadoYellow
        self.view.addSubview(self.launchView)
    }

    override func updateLayout() {
        self.launchView.autoMatch(.width, to: .width, of: self.view, withMultiplier: 1)
        self.launchView.autoMatch(.height, to: .height, of: self.view, withMultiplier: 1)
    }

    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)
 
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            self.launchView.logo.shake()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(self.delayPresentation)) {
            if let mainNavigationController = self.navigationController {
                mainNavigationController.pushViewController(MainViewController(), animated: true)
            }
        }
    }
}
