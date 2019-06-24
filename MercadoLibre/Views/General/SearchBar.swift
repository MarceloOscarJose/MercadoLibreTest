//
//  SearchBar.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/5/17.
//  Copyright © 2017 Marcelo Oscar José. All rights reserved.
//

import UIKit

protocol SearchBarDelegate: class {
    func searchButtonPressed()
    func listButtonPressed()
}

class SearchBar: BaseView, UISearchBarDelegate {

    let searchBar: UISearchBar = UISearchBar()
    let listButton: UIButton = UIButton()

    var delegate: SearchBarDelegate?

    override func createControls() {
        self.searchBar.delegate = self
        self.backgroundColor = UIColor.mercadoYellow
        self.createListButton()
        self.createSearchBar()
    }

    // MARK - Private
    func createSearchBar() {
        self.searchBar.barTintColor = UIColor.mercadoYellow
        self.searchBar.layer.borderWidth = 1
        self.searchBar.layer.borderColor = UIColor.mercadoYellow.cgColor
        self.searchBar.text = "Impresora"
        self.searchBar.placeholder = "search_input_placehoder".localized

        self.addSubview(self.searchBar)

        self.searchBar.autoAlignAxis(toSuperviewAxis: .horizontal)
        self.searchBar.autoPinEdge(.trailing, to: .leading, of: self.listButton, withOffset: -10)
        self.searchBar.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
    }

    func createListButton() {
        self.listButton.setBackgroundImage(UIImage(named: "Sites"), for: UIControlState.normal)
        self.listButton.addTarget(self, action: #selector(SearchBar.listSites), for: UIControlEvents.touchUpInside)
        self.listButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.addSubview(self.listButton)

        self.listButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        self.listButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        self.listButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        self.listButton.autoMatch(.width, to: .height, of: listButton, withMultiplier: 1)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchAction()
    }

    func searchAction(){
        if let delegate = self.delegate {
            delegate.searchButtonPressed()
        }
    }

    func listSites(){
        if let delegate = self.delegate {
            delegate.listButtonPressed()
        }
    }
}
