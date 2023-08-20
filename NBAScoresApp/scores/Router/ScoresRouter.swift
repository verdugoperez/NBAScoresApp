//
//  ScoresRouter.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 09/08/23.
//

import UIKit

class ScoresRouter {
    static func showScores() -> UIViewController {
       
        let interctor =  ScoresInteractor(requestManager: RequestManager())
        let presenter = ScoresPresenter(scoresInteractor: interctor)
        let view = ScoresViewController(presenter: presenter)
    
        presenter.ui = view
        
        return view
    }
}
