//
//  NetworkManager.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/1/23.
//

import Foundation
import UIKit

// A singleton is a design pattern that lets you ensure a class has only one instance, but allows flexibility in case of future changes.
final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    // Function still returns an array of Appetizer objects. The array is NOT optional, so if it cannot be returned, the function throws an error.
    // The "throws" won't let us NOT throw an error if something goes wrong. Doesn't allow the developer to forget to handle an error (by leaving out a completion handler).
    func getAppetizers () async throws ->  [Appetizer] {
        // 1.1: Check to make sure we have a good URL.
        guard let url = URL(string: appetizerURL) else {
            throw AppetizersError.invalidURL
        }
        
        // 1.2: Returns a tuple of (Data, URLResponse) which are NOT optional. If they are nil, it throws.
        // In the previous version (without async) they were optional, and we had a series of guard-let statements.
        let (data, _) = try await URLSession.shared.data(from:url)
        
        // 1.3: Replace completed with return and throw statements.
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        } catch {
            throw AppetizersError.invalidData
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        // If image is already there, call completion handler with image.
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        // If not, make network call to get image.
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            
            // Check if data is ok and if we can create an image with that data.
            // Not checking for specific errors in this case because we will just use a placeholder image if the call fails.
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            // If successful:
            // 1. Save image in cache.
            // 2. Call completion handler with image.
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
