//
//  NYCHighSchoolViewController.swift
//  20231009-AkhilPuppala-NYCSchools
//
//  Created by Akhil  on 09/10/23.
//

import UIKit
import RSLoadingView

class NYCHighSchoolViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = {
        NYCHighSchoolViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }
    
    func initView() {
        self.showActivityIndicator()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .darkGray
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        
        tableView.allowsSelection = true
        tableView.register(NYCHighSchoolTableViewCell.nib, forCellReuseIdentifier: NYCHighSchoolTableViewCell.identifier)
    }
    
    func initViewModel() {
        // Get employees data
        viewModel.getHomeData()
        
        // Reload TableView closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.hideActivityIndicator()
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension NYCHighSchoolViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension NYCHighSchoolViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.nycHighSchoolCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NYCHighSchoolTableViewCell.identifier, for: indexPath) as? NYCHighSchoolTableViewCell else { fatalError("xib does not exists") }
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.isUserInteractionEnabled = true
        cell.selectionStyle = .none
        cell.cellViewModel = cellVM
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name: "Detail", bundle: nil)
        let viewcontroller : UIViewController = mainView.instantiateViewController(withIdentifier: "NYCHighSchoolDetailViewController") as! NYCHighSchoolDetailViewController
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
