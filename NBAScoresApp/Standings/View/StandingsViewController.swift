//
//  StandingsViewController.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 14/08/23.
//

import UIKit

class StandingsViewController: UIViewController {
    private let presenter: StandingsPresenter
    private var standingsTableView = CustomTableView<StandingsTableViewCell>(frame: .zero, style: .plain, rowHeight: 50)
    private var totalGamesLabel = TitleLabel(textAlignment: .center, fontSize: 14, fontStyle: .bold)
    private var stackView = CustomStackView(alignment: .fill, distribution: .fill, spacing: 0, axis: .vertical)
    private let segmentedControl = SegmentedControl(items: ["East", "West"])
    private var loaderView = LoaderView()
    
    init(presenter: StandingsPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(receivedData(_:)), name: Notification.Name("SelectedFavouriteTeamNotification"), object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date())
        presenter.searchStandingsBy("\(currentYear)")
        setupUIComponents()
      
    }
    
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            presenter.filterStandingsBy(conference: .Eastern)
        case 1:
            presenter.filterStandingsBy(conference: .Western)
        default:
            break
        }
    }
    
    private func setupUIComponents() {
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        view.backgroundColor = .systemBackground
        stackView.addArrangedSubview(segmentedControl)
        stackView.addArrangedSubview(standingsTableView)
        
        standingsTableView.separatorStyle = .singleLine
        standingsTableView.dataSource = self
        standingsTableView.delegate = self
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
        ])
        
        loaderView.addToView(self.view)
    }
    
    // MARK: - Notifications
    @objc func receivedData(_ notification: Notification) {
        presenter.favouriteTeamSelected = notification.object as? FavouriteTeamEntity
    }
}


extension StandingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return StandingsTableViewHeader()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.filteredModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StandingsTableViewCell.reuseID, for: indexPath) as? StandingsTableViewCell else { return UITableViewCell() }
      
        let standing = presenter.filteredModels[indexPath.row]
        
        cell.configure(model: standing, index:  indexPath.row + 1)
        
        return cell
    }
}

extension StandingsViewController: StandingsUI {
    func update() {
        DispatchQueue.main.async { [weak self] in
            self?.standingsTableView.reloadData()
        }
    }
    
    func showLoader() {
        loaderView.show()
    }
    
    func hideLoader() {
        loaderView.hide()
    }
    
    
}
