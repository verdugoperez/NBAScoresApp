//
//  StandingsRouter.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 14/08/23.
//

import UIKit

class StandingsRouter {
    static func showStandings() -> UIViewController {
        let interctor =  StandingsInteractor(requestManager: RequestManager())
        let presenter = StandingsPresenter(standingsInteractor: interctor)
        let view = StandingsViewController(presenter: presenter)
    
        presenter.ui = view
        
        return view
    }
}
