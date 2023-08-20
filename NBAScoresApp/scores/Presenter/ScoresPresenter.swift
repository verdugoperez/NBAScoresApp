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
    private(set) var todayDateString = ""
    private(set) var yesterdayDateString = ""
    private(set) var tomorrowDateString = ""
    private var dateFormatter = DateFormatter()
    private var dateFormat = "yyyy-MM-dd"
    private var calendar = Calendar.current

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
        dateFormatter.dateFormat = dateFormat
        let currentDate = Date()
        todayDateString = dateFormatter.string(from: currentDate)
        
        if let yesterday = calendar.date(byAdding: .day, value: -1, to: currentDate) {
            yesterdayDateString = dateFormatter.string(from: yesterday)
        }
        
        if let tomorrow = calendar.date(byAdding: .day, value: +1, to: currentDate) {
            tomorrowDateString = dateFormatter.string(from: tomorrow)
        }
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
