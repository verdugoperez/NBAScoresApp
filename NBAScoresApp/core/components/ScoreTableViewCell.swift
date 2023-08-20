//
//  ScoreTableViewCell.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 10/08/23.
//

import UIKit

class ScoreTableViewCell: UITableViewCell, ReusableCell {
    static let reuseID = "ScoreTableViewCell"
    private var mainStackView = CustomStackView(alignment: .fill, distribution: .fillProportionally, spacing: 8, axis: .vertical)
    private var teamsStackView = CustomStackView(alignment: .fill, distribution: .fillEqually, spacing: 0, axis: .horizontal)
    private var homeStackView = CustomStackView(alignment: .fill, distribution: .fillProportionally, spacing: 0, axis: .vertical)
    private var awayStackView = CustomStackView(alignment: .fill, distribution: .fillProportionally, spacing: 0, axis: .vertical)
    private var favouriteTeamLabel = TitleLabel(textAlignment: .center, fontSize: 14, fontStyle: .bold)
    
    private var homeTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var awayTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var homeTeamContainerImageView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private var awayTeamContainerImageView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private var homeTeamLabel = TitleLabel(textAlignment: .center, fontSize: 16, fontStyle: .bold)
    private var awayTeamLabel = TitleLabel(textAlignment: .center, fontSize: 16, fontStyle: .bold)
    private var versusLabel = TitleLabel(textAlignment: .center, fontSize: 18, fontStyle: .bold, text: "VS")
    private var dateTimeLabel = TitleLabel(textAlignment: .center, fontSize: 14, fontStyle: .italic)
    
    private func setupUIComponents() {
        mainStackView.addArrangedSubview(teamsStackView)
        mainStackView.addArrangedSubview(dateTimeLabel)
        
        teamsStackView.addArrangedSubview(homeStackView)
        teamsStackView.addArrangedSubview(versusLabel)
        teamsStackView.addArrangedSubview(awayStackView)
        
        homeStackView.addArrangedSubview(homeTeamContainerImageView)
        homeStackView.addArrangedSubview(homeTeamLabel)
        
        awayStackView.addArrangedSubview(awayTeamContainerImageView)
        awayStackView.addArrangedSubview(awayTeamLabel)
        
        addSubview(mainStackView)
        homeTeamContainerImageView.addSubview(homeTeamImageView)
        awayTeamContainerImageView.addSubview(awayTeamImageView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            homeTeamContainerImageView.heightAnchor.constraint(equalToConstant: 120),
            awayTeamContainerImageView.heightAnchor.constraint(equalToConstant: 120),
            
            homeTeamImageView.topAnchor.constraint(equalTo: homeTeamContainerImageView.topAnchor),
            homeTeamImageView.leadingAnchor.constraint(equalTo: homeTeamContainerImageView.leadingAnchor),
            homeTeamImageView.trailingAnchor.constraint(equalTo: homeTeamContainerImageView.trailingAnchor),
            homeTeamImageView.bottomAnchor.constraint(equalTo: homeTeamContainerImageView.bottomAnchor),
            
            awayTeamImageView.topAnchor.constraint(equalTo: awayTeamContainerImageView.topAnchor),
            awayTeamImageView.leadingAnchor.constraint(equalTo: awayTeamContainerImageView.leadingAnchor),
            awayTeamImageView.trailingAnchor.constraint(equalTo: awayTeamContainerImageView.trailingAnchor),
            awayTeamImageView.bottomAnchor.constraint(equalTo: awayTeamContainerImageView.bottomAnchor),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Score) {
        homeTeamLabel.text = "\(model.homeTeam) - \(model.homeTeamScore)"
        homeTeamImageView.image = UIImage(named: model.homeTeam)
        awayTeamLabel.text = "\(model.awayTeam) - \(model.awayTeamScore)"
        awayTeamImageView.image = UIImage(named: model.awayTeam)
        dateTimeLabel.text = "Scheduled @ \(model.formattedHireDate)"
        configureScore(homeTeamScore: model.homeTeamScore, awayTeamScore: model.awayTeamScore)
        
        if let favouriteTeam = model.favouriteTeam {
            mainStackView.addArrangedSubview(favouriteTeamLabel)
            favouriteTeamLabel.textColor = .magenta
            favouriteTeamLabel.text = "⭐️ \(favouriteTeam.favouriteTeamName)"
            favouriteTeamLabel.isHidden = false
        } else {
            favouriteTeamLabel.isHidden = true
        }
    }
    
    private func configureScore(homeTeamScore: Int, awayTeamScore: Int) {
        if homeTeamScore > awayTeamScore {
            homeTeamLabel.textColor = Colors.winnerGreen
            awayTeamLabel.textColor = Colors.loserRed
        } else if awayTeamScore > homeTeamScore {
            homeTeamLabel.textColor = Colors.loserRed
            awayTeamLabel.textColor = Colors.winnerGreen
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
