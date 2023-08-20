//
//  StandingsTableViewCell.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 14/08/23.
//

import UIKit

class StandingsTableViewCell: UITableViewCell, ReusableCell {
    static let reuseID = "StandingsTableViewCell"
    private var mainStackView = CustomStackView(alignment: .center, distribution: .fillProportionally, spacing: 8, axis: .horizontal)
    private var teamNumberLabel = TitleLabel(textAlignment: .left, fontSize: 13, fontStyle: .bold)
    private var teamStandingLabel = TitleLabel(textAlignment: .right, fontSize: 13, fontStyle: .italic)
    private var teamLabel = TitleLabel(textAlignment: .left, fontSize: 13, fontStyle: .bold)
    private var teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private var teamContainerImageView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUIComponents() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(teamNumberLabel)
        mainStackView.addArrangedSubview(teamContainerImageView)
        mainStackView.addArrangedSubview(teamLabel)
        mainStackView.addArrangedSubview(teamStandingLabel)
        teamContainerImageView.addSubview(teamImageView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            teamContainerImageView.heightAnchor.constraint(equalToConstant: 30),
            teamContainerImageView.widthAnchor.constraint(equalToConstant: 30),
            teamNumberLabel.widthAnchor.constraint(equalToConstant: 20),
            
            teamImageView.topAnchor.constraint(equalTo: teamContainerImageView.topAnchor),
            teamImageView.leadingAnchor.constraint(equalTo: teamContainerImageView.leadingAnchor),
            teamImageView.trailingAnchor.constraint(equalTo: teamContainerImageView.trailingAnchor),
            teamImageView.bottomAnchor.constraint(equalTo: teamContainerImageView.bottomAnchor),
        ])
    }
    
    func configure(model: Standing, index: Int) {
        
        teamNumberLabel.text = "\(index)"
        teamStandingLabel.text = "\(model.wins) - \(model.losses)"
        teamLabel.text = "\(model.city) \(model.name)"
        teamImageView.image = UIImage(named: model.key)
        
        if let _ = model.favouriteTeam {
            teamLabel.text! += " ⭐️"
            teamLabel.textColor = .magenta
        } else {
            teamLabel.text = "\(model.city) \(model.name)"
            teamLabel.textColor = .black
        }
    }

}
