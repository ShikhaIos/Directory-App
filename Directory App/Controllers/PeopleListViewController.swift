//
//  PeopleListViewController.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import UIKit

class PeopleListViewController: UIViewController{
    lazy var viewModel = {
        PeopleViewModel()
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

        tableView.register(PeopleListViewCell.nib, forCellReuseIdentifier: PeopleListViewCell.identifier)
    }
    
    func createNavigationBarUI(){
        self.title = "View People List"
        self.navigationItem.backBarButtonItem = NavigationStyling.backBarButtonWithoutText()
    }

    func initViewModel() {
        viewModel.getPeopleList()
        
        // Reload TableView closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension PeopleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

// MARK: - UITableViewDataSource

extension PeopleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.peopleCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleListViewCell.identifier, for: indexPath) as? PeopleListViewCell else { fatalError("xib does not exists") }
        let dataProvider = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewdataProviderModel = dataProvider
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let dataProvider = viewModel.getCellViewModel(at: indexPath)
        print(dataProvider)
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PeopleListDetailViewController") as? PeopleListDetailViewController
        
        vc?.viewModel = dataProvider
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

