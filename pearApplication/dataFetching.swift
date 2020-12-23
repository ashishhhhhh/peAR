//
//  dataFetching.swift
//  pearApplication
//
//  Created by TARUN on 12/22/20.
//  Copyright © 2020 ashish. All rights reserved.
//

import Foundation

class dataFeatching{
    
    private var dataTask: URLSessionDataTask?
    
    func restaurantApiCalling(completion: @escaping(Result<[restuarantData], Error>) -> Void) {
        let restuarantDataURL = "https://backend.pearpartner.com/order/user/previous_orders/Qu2cRybfWGMaki7eJtk2O0oxE3y2"
        
        guard let url = URL(string: restuarantDataURL) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
           if let error = error
                      {
                          completion(.failure(error))
                          print("Failure due to \(error.localizedDescription)")
                          return
                      }
                      
                      guard let response = response as? HTTPURLResponse else{
                          print("Empty response")
                          return
                      }
                      print("Response status code: \(response.statusCode)")
                      
                      guard let data = data else {
                          print("Empty data")
                          return
                      }
                      do
                      {
                          let decoder = JSONDecoder()
                         let jasonData = try decoder.decode([restuarantData].self, from: data)
                          
                        DispatchQueue.main.async {
                            completion(.success(jasonData))
                      }
                      }catch let error
                        {
                        completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
}
