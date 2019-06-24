//
//  BaseViewController.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/5/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit
import PureLayout

class BaseViewController: UIViewController, TopBarDelegate, SearchBarDelegate {

    var topBar: TopBar!
    var searchBar: SearchBar!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mercadoYellowBack
        self.createViews()
        self.updateLayout()
    }

    // MARK - Search Delegate
    func listButtonPressed() {
        if let mainNavigationController = self.navigationController {
            mainNavigationController.pushViewController(SitesTableViewController(), animated: true)
        }
    }

    func searchButtonPressed() {
        
    }

    // MARK: - Generic methods
    func createViews() {
    }

    func updateLayout() {
    }

    // MARK - TopBar Delegate
    func leftButtonPressed() {
        let _ = self.navigationController?.popViewController(animated: true)
    }

    // MARK - Private
    func createSearchBar() {
        self.searchBar = SearchBar()
        self.searchBar.delegate = self
        self.view.addSubview(self.searchBar)

        self.searchBar.autoPin(toTopLayoutGuideOf: self, withInset: 0)
        self.searchBar.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        self.searchBar.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0)
        self.searchBar.autoMatch(.height, to: .height, of: self.view, withMultiplier: 0.08)
    }

    func createTopBar(title: String) {
        self.topBar = TopBar(title: title)
        self.topBar.delegate = self
        self.view.addSubview(self.topBar)

        self.topBar.autoPin(toTopLayoutGuideOf: self, withInset: 0)
        self.topBar.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        self.topBar.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0)
        self.topBar.autoMatch(.height, to: .height, of: self.view, withMultiplier: 0.08)
    }
}
