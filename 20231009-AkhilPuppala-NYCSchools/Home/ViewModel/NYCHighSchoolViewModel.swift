//
//  NYCHighSchoolViewModel.swift
//  20231009-AkhilPuppala-NYCSchools
//
//  Created by Akhil  on 09/10/23.
//

import Foundation
import Combine
import SwiftUI

class NYCHighSchoolViewModel: NSObject {
    
    private var cancellables = Set<AnyCancellable>()
    var reloadTableView: (() -> Void)?
    
    var highSchools = NYCHighSchools()
    
    var nycHighSchoolCellViewModels = [NYCHighSchoolCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    func getHomeData() {
        NetworkManager.shared.getData(endpoint: .nycHighSchools, type: NYCHighSchool.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }
    receiveValue: { [weak self] highSchoolData in
        self?.fetchData(highSchool: highSchoolData)
    }
    .store(in: &cancellables)
    }
    
    func fetchData(highSchool: NYCHighSchools) {
        self.highSchools = highSchool // Cache
        var vms = [NYCHighSchoolCellViewModel]()
        for highSchool in highSchools {
            vms.append(createCellModel(highSchool: highSchool))
        }
        nycHighSchoolCellViewModels = vms
    }
    
    func createCellModel(highSchool: NYCHighSchool) -> NYCHighSchoolCellViewModel {
        let schoolName = highSchool.schoolName
        let location = highSchool.location
        let phoneNumber = highSchool.phoneNumber
        let email = highSchool.schoolEmail
        let overview = highSchool.overviewParagraph
        
        return NYCHighSchoolCellViewModel(overViewParagraph: overview ?? "", schoolName: schoolName ?? "", location: location ?? "", phoneNumber: phoneNumber ?? "", schoolEmail: email ?? "")
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> NYCHighSchoolCellViewModel {
        return nycHighSchoolCellViewModels[indexPath.row]
    }
}
