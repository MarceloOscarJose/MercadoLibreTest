//
//  MainView.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/6/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class MainView: BaseView {

    let searchTable:UITableView = UITableView()
    let rowsByScreen:CGFloat = 3.3

    override func layoutSubviews() {
        super.layoutSubviews()
        searchTable.rowHeight = searchTable.frame.size.height / self.rowsByScreen
    }

    override func createControls() {
        self.searchTable.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.backgroundColor = UIColor.red
        self.addSubview(searchTable)
    }

    override func updateLayout() {
        self.searchTable.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        self.searchTable.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        self.searchTable.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        self.searchTable.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
    }
}
