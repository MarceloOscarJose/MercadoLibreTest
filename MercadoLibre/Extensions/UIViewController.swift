//
//  ViewController.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/3/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController {

    func startLoading() {
        let size = CGSize(width: 30, height:30)
        let activityData = ActivityData(size: size, message: "loading_text".localized, type: NVActivityIndicatorType.ballRotateChase, color: .white)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }

    func stopLoading() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }

    func startActivityTable(tableView: UITableView) {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activityIndicator.frame = CGRect(x: 0, y: 20, width: 320, height: tableView.rowHeight);
        tableView.tableFooterView = activityIndicator
        activityIndicator.startAnimating()
    }

    func stopActivityTable(tableView: UITableView) {
        tableView.tableFooterView = nil
    }

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func showErrorAlert(_ message:String){
        if(message != "") {
            let alertVC = UIAlertController(title: "alert_error_title".localized, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "alert_error_ok".localized, style: .default, handler: nil)
            alertVC.addAction(okAction)

            DispatchQueue.main.async { () -> Void in
                self.present(alertVC, animated: true, completion: nil)
            }
        }
    }
}
