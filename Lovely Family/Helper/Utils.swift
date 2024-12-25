//
//  Utils.swift
//  Simart UMBY
//
//  Created by фкшуа on 06/11/24.
//

import Foundation
import SwiftUI

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func getSecond(second: UInt64) -> UInt64 {
    return second * 1_000_000_000
}

func setNavigationBarLayout(backgroundColor: String = "#1E3A8A") {
    // Customize UINavigationBarAppearance
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(hex: backgroundColor)  // Set navigation bar background color
    
    // Customize the title color
    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    
    // Apply the appearance
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
    
    // Customize the back button color and title
    // let backButtonImage = UIImage(systemName: "arrow.backward") // Use a custom SF Symbol or image
    // appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
    UINavigationBar.appearance().tintColor = .white // Back button and arrow color
}

func generateRandomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

func performNetworkingTask<T>(
    task: () async throws -> T?,
    onSuccess: (T) -> Void,
    onFailure: (_ error: String) -> Void
) async {
    do {
        let result = try await task()
        
        guard let data = result else { return }
        
        onSuccess(data)
    } catch NetworkingError.INVALID_RESPONSE {
        onFailure("Error on the server")
    } catch NetworkingError.INVALID_DATA {
        onFailure("Error parsing response data")
    } catch NetworkingError.INVALID_URL {
        onFailure("Invalid URL")
    } catch {
        onFailure("Unexpected error: \(error)")
    }
}

func delay(second: UInt64) async {
    do { try await Task.sleep(nanoseconds: getSecond(second: second)) } catch {}
}

func createFormDataBody(with parameters: [String: String], fileURL: URL) -> Data {
    let boundary = UUID().uuidString
    
    var body = Data()
    
    // Add parameters
    for (key, value) in parameters {
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(value)\r\n".data(using: .utf8)!)
    }
    
    // Add file
    let filename = fileURL.lastPathComponent
    let mimeType = "image/png" // Replace with the appropriate MIME type
    body.append("--\(boundary)\r\n".data(using: .utf8)!)
    body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
    body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
    if let fileData = try? Data(contentsOf: fileURL) {
        body.append(fileData)
    }
    body.append("\r\n".data(using: .utf8)!)
    
    // End the body
    body.append("--\(boundary)--\r\n".data(using: .utf8)!)
    
    return body
}
