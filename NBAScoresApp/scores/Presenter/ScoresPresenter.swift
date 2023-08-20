//
//  ScoresPresenter.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 09/08/23.
//

import Foundation

protocol ScoresUI {
    func update()
    func showLoader()
    func hideLoader()
}

class ScoresPresenter {
    var ui: ScoresUI?
    private let scoresInteractor: ScoresInteractor
    var models = [Score]()
    private var originalModels = [Score]()
   
    var totalGames: String {
        "\(models.count) Games"
    }
    var favouriteTeamSelected: FavouriteTeamEntity? {
        didSet {
            FavoriteTeamUtility.reorderScores(array: &models, originalArray: originalModels, favourite: favouriteTeamSelected)
            ui?.update()
        }
    }
    
    init(scoresInteractor: ScoresInteractor) {
        self.scoresInteractor = scoresInteractor
    }
   
    func getDayScores(_ dateString: String) {
        ui?.showLoader()
        
        Task {
            models = await scoresInteractor.searchScore(by: dateString)
            originalModels = models
            FavoriteTeamUtility.reorderScores(array: &models, originalArray: originalModels, favourite: favouriteTeamSelected)
            ui?.update()
            ui?.hideLoader()
        }
    }
}
