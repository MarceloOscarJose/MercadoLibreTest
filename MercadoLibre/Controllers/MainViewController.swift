//
//  ViewController.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/3/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit
import PureLayout

class MainViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    var isSearching = true
    var resultSearch: Search = Search()
    var item: Item!
    var mainView: MainView = MainView()
    var site = "unknown"

    // MARK: Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if self.searchBar.searchBar.text != "" {
            let site = Config.sharedInstance.getDefaulstSite() ?? Config.sharedInstance.api_site

            if site != self.site {
                self.site = site
                self.searchButtonPressed()
            }
        }
    }

    override func createViews() {
        self.createSearchBar()
        self.mainView.searchTable.register(MainTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.mainView.searchTable.delegate = self
        self.mainView.searchTable.dataSource = self
        self.view.addSubview(self.mainView)
    }

    override func updateLayout() {
        self.mainView.autoPinEdge(.top, to: .bottom, of: self.searchBar, withOffset: 0.0)
        self.mainView.autoPinEdge(toSuperviewEdge: .left, withInset: 0.0)
        self.mainView.autoPinEdge(toSuperviewEdge: .right, withInset: 0.0)
        self.mainView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0.0)
    }

    // MARK - Table delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultSearch.results.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showProduct(item: self.resultSearch.results[indexPath.row])
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = self.resultSearch.results[indexPath.row]
        let itemCurrency = MercadoManager.sharedInstance.getCurrencyById(currencyId: item.currency_id)
        let installmentsCurrency = MercadoManager.sharedInstance.getCurrencyById(currencyId: item.installments.currency_id)

        let cell = MainTableViewCell(item: item, itemCurrency: itemCurrency, installmentsCurrency: installmentsCurrency)
        cell.setNeedsUpdateConstraints()
        return cell
    }

    // MARK - Scroll delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let y: Float = Float(scrollView.contentOffset.y) + Float(scrollView.bounds.size.height) + Float(scrollView.contentInset.bottom)
        let height: Float = Float(scrollView.contentSize.height)
        let distance: Float = 10

        let maxRow = self.mainView.searchTable.numberOfRows(inSection: 0)
        if !self.isSearching && y > height + distance && maxRow < self.resultSearch.paging.total {

            self.startActivityTable(tableView: self.mainView.searchTable)
            DispatchQueue.main.async(execute: { () -> Void in
                self.listItems(offset: maxRow)
            })
        }
    }

    override func searchButtonPressed() {
        self.resultSearch = Search()
        self.listItems(offset: 0)
    }

    // MARK: - Navigation
    func showProduct(item: Item) {
        if let mainNavigationController = self.navigationController {
            mainNavigationController.pushViewController(ProductViewController(item: item), animated: true)
        }
    }

    // MARK: Private
    func listItems(offset: Int) {

        if offset == 0 {
            self.startLoading()
        }

        self.isSearching = true
        self.view.endEditing(true)

        if let text = self.searchBar.searchBar.text {
            SearchManager.searchItems(searchCriteria: text, offset: offset, responseHandler: { (succeeded, msg, search) in

                if succeeded {

                    self.resultSearch.paging = search.paging
                    self.resultSearch.results.append(contentsOf: search.results)
                    self.reloadDataTable()

                    if offset == 0 {
                        let indexPath = IndexPath(row: 0 , section: 0)
                        self.mainView.searchTable.scrollToRow(at: indexPath, at: UITableViewScrollPosition.middle, animated: true)
                        self.stopLoading()
                    }
                } else {
                    if offset == 0 {
                        self.stopLoading()
                    } else {
                        self.stopActivityTable(tableView: self.mainView.searchTable)
                    }
                    self.showErrorAlert(msg)
                }
            })
        }
    }
    
    func reloadDataTable() {

        self.mainView.searchTable.reloadData()

        DispatchQueue.main.async(execute: { () -> Void in
            self.stopActivityTable(tableView: self.mainView.searchTable)
            self.isSearching = false
        })
    }
}
