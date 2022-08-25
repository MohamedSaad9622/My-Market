//
//  Urls.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation

struct UrlServices {
    
    private static let baseURL =
    "https://7d67dd63dc90e18fce08d1f7746e9f41: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@ios-q3-mansoura.myshopify.com/"

    static func productsUrl() -> String{
        return UrlServices.baseURL + "admin/api/2022-01/products.json"
    }
    
}
