//
//  RoomsListViewController.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import UIKit

class RoomsListViewController: UIViewController {
    lazy var viewModel = {
        RoomViewModel()
    }()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        initViewModel()
        createNavigationBarUI()
    }

    func prepareUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .black
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()

        tableView.register(RoomsListViewCell.nib, forCellReuseIdentifier: RoomsListViewCell.identifier)
    }
    
    func createNavigationBarUI(){
        self.title = "View Rooms List"
        self.navigationItem.backBarButtonItem = NavigationStyling.backBarButtonWithoutText()
    }

    func initViewModel() {
        viewModel.getRoomsList()
        
        // Reload TableView closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension RoomsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

// MARK: - UITableViewDataSource

extension RoomsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.roomsCellViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoomsListViewCell.identifier, for: indexPath) as? RoomsListViewCell else { fatalError("xib does not exists") }
        let dataProvider = viewModel.getCellViewModel(at: indexPath)
        cell.dataProvider = dataProvider
        return cell
    }
}


