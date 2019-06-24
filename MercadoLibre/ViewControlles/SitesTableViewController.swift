//
//  SitesTableViewController.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/6/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class SitesTableViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    var sitesData:[Site] = []
    var sitesView: SitesView = SitesView(frame: CGRect.zero)
    let defaults = UserDefaults.standard
    var didSetupConstraints = false

    // MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTopBar(title: "Sitios de Mercado Libre")

        self.sitesView.searchTable.delegate = self
        self.sitesView.searchTable.dataSource = self
        self.sitesView.searchTable.register(MainTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.sitesView)

        self.view.setNeedsUpdateConstraints()
        self.listSites()
    }

    // MARK - Table delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sitesData.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Save site id
        defaults.set(self.sitesData[indexPath.row].id, forKey: "site")
        self.leftButtonPressed()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SitesTableViewCell(site: self.sitesData[indexPath.row])
        cell.setNeedsUpdateConstraints()
        return cell
    }

    // MARK - Private
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            self.sitesView.autoPinEdge(.top, to: .bottom, of: self.topBar, withOffset: 0.0)
            self.sitesView.autoPinEdge(toSuperviewEdge: .left, withInset: 0.0)
            self.sitesView.autoPinEdge(toSuperviewEdge: .right, withInset: 0.0)
            self.sitesView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0.0)
            
            didSetupConstraints = true
        }

        super.updateViewConstraints()
    }

    func listSites() {
        self.startLoading()
        MercadoManager.sharedInstance.listSites(responseHandler: { (succeeded, msg, sites) in
            if succeeded {
                self.sitesData = sites.sorted{ return $0.name < $1.name }
                self.sitesView.searchTable.reloadData()
                self.stopLoading()
            } else {
                self.stopLoading()
                self.showErrorAlert(msg)
            }
        })
    }
}
