//
//  SettingsRouter.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 16/08/23.
//

import UIKit

class SettingsRouter {
    static func showSettings() -> UIViewController {
        let presenter = SettingsPresenter()
        let view = SettingsViewController(presenter: presenter)
    
        return view
    }
}
