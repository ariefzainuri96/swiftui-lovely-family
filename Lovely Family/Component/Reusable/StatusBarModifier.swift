//
//  StatusBarModifier.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

import SwiftUI

struct StatusBarModifier: UIViewControllerRepresentable {
    var backgroundColor: UIColor

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let statusBarFrame = windowScene.statusBarManager?.statusBarFrame {
            let statusBarBackgroundView = UIView(frame: statusBarFrame)
            statusBarBackgroundView.backgroundColor = backgroundColor
            statusBarBackgroundView.tag = 999  // Assign a tag for easy identification

            // Remove any existing status bar views
            windowScene.windows.first?.subviews.forEach { view in
                if view.tag == 999 {
                    view.removeFromSuperview()
                }
            }

            windowScene.windows.first?.addSubview(statusBarBackgroundView)
        }
        
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No need to implement
    }
}

