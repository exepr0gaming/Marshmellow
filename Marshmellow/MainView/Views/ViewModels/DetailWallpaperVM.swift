//
//  DetailWallpaperVM.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 24.05.2022.
//

import SwiftUI

class DetailWallpaperVM: ObservableObject {
    
	@Published var currentTime: Date = .now // need or ?
	@Published var photoForSave: [Any] = []
	
	func getCurrentTime() -> String {
		var result = ""
		let hours = Calendar.current.component(.hour, from: .now)
		let minutes = Calendar.current.component(.minute, from: .now)
		result += hours < 10 ? "0\(hours)" : "\(hours)"
		result += ":"
		result += minutes < 10 ? "0\(minutes)" : "\(minutes)"
		return result
	}
	
	func shareWallpaper(_ photoString: String) {
		let activityVC = UIActivityViewController(activityItems: [photoString], applicationActivities: nil)
		UIApplication.shared.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
		//guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui") else { return }
		//UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
	}
	
}

//struct ShareSheet: UIViewControllerRepresentable {
//
//	// data for share
//	var items: [Any]
//
//	func makeUIViewController(context: Context) -> UIActivityViewController {
//		let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
//		return controller
//	}
//	func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
//}

extension UIApplication {
		
		var keyWindow: UIWindow? {
				// Get connected scenes
				return UIApplication.shared.connectedScenes
						// Keep only active scenes, onscreen and visible to the user
						.filter { $0.activationState == .foregroundActive }
						// Keep only the first `UIWindowScene`
						.first(where: { $0 is UIWindowScene })
						// Get its associated windows
						.flatMap({ $0 as? UIWindowScene })?.windows
						// Finally, keep only the key window
						.first(where: \.isKeyWindow)
		}
		
}
