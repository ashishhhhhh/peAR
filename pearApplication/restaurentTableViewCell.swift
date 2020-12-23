//
//  restaurentTableViewCell.swift
//  pearApplication
//
//  Created by TARUN on 12/23/20.
//  Copyright © 2020 ashish. All rights reserved.
//

import UIKit

class restaurentTableViewCell: UITableViewCell {

    
//    private var urlSessionFile: URLSessionDataTask?
    @IBOutlet weak var restaurentLogo: UIImageView!
    @IBOutlet weak var restuarentName: UILabel!
    @IBOutlet weak var items: UILabel!
    @IBOutlet weak var orderedDate: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    private var urlString = ""
    
    func setCellWithValue(_ restaurent: restuarantData)
    {
        updateUI(restaurant_name: restaurent.restaurant_name, restaurant_location: restaurent.restaurant_location, restaurant_image: restaurent.restaurant_image, grand_total: restaurent.grand_total, timestamp: restaurent.timestamp)
    }
    
    func updateUI(restaurant_name: String?, restaurant_location: String?, restaurant_image: String?, grand_total: Double?, timestamp: String?
) {
        self.orderedDate.text = timestamp
        self.totalAmount.text =  String(format: "%f", grand_total!)
        self.restuarentName.text = restaurant_name
        
        if let imageViewFile = URL(string: restaurant_image!)
        {
            URLSession.shared.dataTask(with: imageViewFile) { (data, response, error) in
                if let error = error
                {
                    print("encountered Error \(error.localizedDescription)")
                    return
                }
                guard let data = data
                else
                {
                    print("Empty data")
                    return
                }
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data)
                    {
                        self.restaurentLogo.image = image
                    }
                }
                
            }.resume()
        }
        
    }

}
