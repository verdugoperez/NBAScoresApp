//
//  StandingsPresenter.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 15/08/23.
//

import Foundation

protocol StandingsUI {
    func update()
    func showLoader()
    func hideLoader()
}

class StandingsPresenter {
    var ui: StandingsUI?
    private let standingsInteractor: StandingsInteractor
    private var models = [Standing]()
    private(set) var  filteredModels = [Standing]()
    var favouriteTeamSelected: FavouriteTeamEntity? {
        didSet {
            FavoriteTeamUtility.reorderStandings(array: &filteredModels, favourite: favouriteTeamSelected)
            ui?.update()
        }
    }
    init(standingsInteractor: StandingsInteractor) {
        self.standingsInteractor = standingsInteractor
    }
    
    func filterStandingsBy(conference: Conference) {
        filteredModels = models.filter { $0.conference.rawValue == conference.rawValue }
        FavoriteTeamUtility.reorderStandings(array: &filteredModels, favourite: favouriteTeamSelected)
        ui?.update()
    }
    
    func searchStandingsBy(_ year: String) {
        ui?.showLoader()
        
        Task {
            models = await standingsInteractor.searchStanding(by: year)
            models.sort { $0.conferenceRank < $1.conferenceRank }
            filterStandingsBy(conference: .Eastern)
            ui?.update()
            ui?.hideLoader()
        }
    }
}
