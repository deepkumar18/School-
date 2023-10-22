//
//  BaseViewController.swift
//  20231009-AkhilPuppala-NYCSchools
//
//  Created by Akhil  on 10/10/23.
//

import UIKit
import RSLoadingView

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(rgb: 0x247bdc)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func showActivityIndicator() {
        let loadingView = RSLoadingView()
        loadingView.show(on: view)
    }
    
    func hideActivityIndicator() {
        RSLoadingView.hide(from: self.view)
    }
}
