//
//  StandingsTableViewHeader.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 15/08/23.
//

import UIKit

class StandingsTableViewHeader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        
        let stackView = CustomStackView(alignment: .fill, distribution: .equalSpacing, spacing: 0, axis: .horizontal)
        
        let numberLabel = TitleLabel(textAlignment: .left, fontSize: 13, fontStyle: .italic, text: "#", textColor: .gray)
        let teamLabel = TitleLabel(textAlignment: .left, fontSize: 13, fontStyle: .italic, text: "Team", textColor: .gray)
        let standingsLabel = TitleLabel(textAlignment: .left, fontSize: 13, fontStyle: .italic, text: "W - L", textColor: .gray)
        
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(teamLabel)
        stackView.addArrangedSubview(standingsLabel)
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

