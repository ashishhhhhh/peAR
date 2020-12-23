//
//  restaurentViewModel.swift
//  pearApplication
//
//  Created by TARUN on 12/23/20.
//  Copyright © 2020 ashish. All rights reserved.
//

import Foundation
class restaurentViewmodel {
    private var apiServices = dataFeatching()
    private var restaurentName = [restuarantData]()
    
    func LoadDataToScreen(completion: @escaping() -> ()) {
        apiServices.restaurantApiCalling { [weak self] (result) in
            switch result{
            case .success(let listOf):
                self?.restaurentName = listOf.reversed()
            case .failure(let error):
                print("error has occured \(error)")
            }
        }
    }
    func numberOfRowInSection(section: Int) -> Int {
        if restaurentName.isEmpty == false
        {
            return restaurentName.count
            
        }
        return 0
    }
    func cellForRow (indexPath: IndexPath) -> restuarantData {
        return restaurentName[indexPath.row]
    }
}
