//
//  SettingsViewController.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 16/08/23.
//

import UIKit



class SettingsViewController: UIViewController {
    private let presenter: SettingsPresenter
    private let pickerView = UIPickerView()
    private let stackView = CustomStackView(alignment: .fill, distribution: .fillProportionally, spacing: 0, axis: .vertical)
    private let favouriteTeamLabel = TitleLabel(textAlignment: .center, fontSize: 15, fontStyle: .bold, text: "Favourite Team:")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIComponents()
        // Do any additional setup after loading the view.
    }
    
    init(presenter: SettingsPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUIComponents() {
        view.backgroundColor = .systemBackground
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(favouriteTeamLabel)
        stackView.addArrangedSubview(pickerView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - UIPickerViewDataSource
extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.models.count
    }
}

// MARK: - UIPickerViewDelegate
extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return presenter.modelsNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var selectedTeam: FavouriteTeamEntity?
        
        if presenter.models[row] != "NONE" {
            selectedTeam = FavouriteTeamEntity(teamId: presenter.models[row], favouriteTeamName: presenter.modelsNames[row])
        }
     
        NotificationCenter.default.post(name: Notification.Name("SelectedFavouriteTeamNotification"), object: selectedTeam)

    }
}
