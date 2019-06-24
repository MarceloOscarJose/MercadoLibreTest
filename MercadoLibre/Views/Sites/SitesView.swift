//
//  SitesView.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/3/17.
//  Copyright © 2017 Marcelo Oscar José. All rights reserved.
//

import UIKit

class SitesView: BaseView {
    
    let searchTable: UITableView = UITableView()

    override func createControls() {
        self.searchTable.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.addSubview(searchTable)
     }
    
    override func updateLayout() {
        self.searchTable.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        self.searchTable.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        self.searchTable.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        self.searchTable.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
    }
}
