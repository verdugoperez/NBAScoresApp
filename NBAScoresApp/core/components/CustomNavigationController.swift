//
//  CustomNavigationController.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 14/08/23.
//

import UIKit

class CustomNavigationController: UINavigationController {
    let rootViewController: UIViewController?
    init(rootViewController: UIViewController, title: String? = nil, prefersLargeTitles: Bool = false, rightBarButtonItem: UIBarButtonItem? = nil) {
        self.rootViewController = rootViewController
        super.init(rootViewController: rootViewController)
        setupNavigationController(title: title, prefersLargeTitles: prefersLargeTitles, rightBarButtonItem: rightBarButtonItem)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupNavigationController(title: String?, prefersLargeTitles: Bool, rightBarButtonItem: UIBarButtonItem?) {
        if let title = title {
            rootViewController?.title = title
            navigationBar.prefersLargeTitles = prefersLargeTitles
        }
    
        if let rightBarButtonItem = rightBarButtonItem {
            rootViewController?.navigationItem.rightBarButtonItem = rightBarButtonItem
        }
    }
}
