//
//  ViewController.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 08/08/23.
//

import UIKit

class ScoresViewController: UIViewController {
    // MARK: - Properties
    private let presenter: ScoresPresenter
    private var scoresTableView = CustomTableView<ScoreTableViewCell>(frame: .zero, style: .plain, rowHeight: 220)
    private var totalGamesLabel = TitleLabel(textAlignment: .center, fontSize: 14, fontStyle: .bold)
    private var stackView = CustomStackView(alignment: .fill, distribution: .fill, spacing: 8, axis: .vertical)
    private var loaderView = LoaderView()
    private var emptyLabel = TitleLabel(textAlignment: .center, fontSize: 14, fontStyle: .bold, text: "No games available")
    private let segmentedControl = SegmentedControl(items: ["Yesterday", "Today", "Tomorrow"])
   
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            presenter.getDayScores(presenter.yesterdayDateString)
        case 1:
            presenter.getDayScores(presenter.todayDateString)
        case 2:
            presenter.getDayScores(presenter.tomorrowDateString)
        default:
            break
        }
    }
    
    // MARK: Lifecycle
    init(presenter: ScoresPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUIComponents()
        presenter.getDayScores(presenter.todayDateString)
        NotificationCenter.default.addObserver(self, selector: #selector(receivedData(_:)), name: Notification.Name("SelectedFavouriteTeamNotification"), object: nil)

    }
    
    // MARK: - Setup components
    private func setupUIComponents() {
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 1
        scoresTableView.addSubview(emptyLabel)
        view.backgroundColor = .systemBackground
        stackView.addArrangedSubview(segmentedControl)
        stackView.addArrangedSubview(totalGamesLabel)
        stackView.addArrangedSubview(scoresTableView)
        scoresTableView.dataSource = self
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            emptyLabel.centerXAnchor.constraint(equalTo: scoresTableView.centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: scoresTableView.centerYAnchor),
            
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

// MARK: - ScoresUI
extension ScoresViewController: ScoresUI {
    func update() {
        DispatchQueue.main.async{ [weak self] in
            self?.scoresTableView.reloadData()
            self?.totalGamesLabel.text = self?.presenter.totalGames
        }
    }
    
    func showLoader() {
        loaderView.show()
    }
    
    func hideLoader() {
        loaderView.hide()
    }
}

// MARK: - UITableViewDataSource
extension ScoresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emptyLabel.isHidden = !presenter.models.isEmpty
        return presenter.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScoreTableViewCell.reuseID, for: indexPath) as? ScoreTableViewCell else { return UITableViewCell() }
        let score = presenter.models[indexPath.row]
        cell.configure(model: score)
        
        return cell
    }
}
