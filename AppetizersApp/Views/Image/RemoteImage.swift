//
//  RemoteImage.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/2/23.
//

import SwiftUI

// If network call fails, show placeholder.
// If network call succeeds, AppetizerRemoteImage will see the change and redraw UI.

final class ImageLoader: ObservableObject {

    // Broadcast the change when the image changes.
    @Published var image: Image? = nil
    
    // Make network call.
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else { return }
            // No need for specific error messages. Just show placeholder if call fails.
            
            DispatchQueue.main.async {
                // Initialize SwiftUI image from UIImage
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

// "Helper" struct. If we have an image from the network call, show that. If not, show placeholder image.
struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

// This is what we will use in the SwiftUI code.
struct AppetizerRemoteImage: View {
    
    // Create ImageLoader instance.
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        
        // Remote image takes in an optional image. Pass in the image from ImageLoader instance.
        RemoteImage(image: imageLoader.image)
            .onAppear {
                // Triggers the network call.
                imageLoader.load(fromURLString: urlString) }
            }
}


