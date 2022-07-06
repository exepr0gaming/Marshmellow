//
//  ImageLoader.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI
import AVKit
import MobileCoreServices
import Photos

//private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: ObservableObject {
	
	let url: String?
	
	@Published var image: UIImage?
	@Published var isLoading = false
	@Published var errorMessage: String? = nil
	//@Published var video: AP?
	@Published var video: UTType?
	
	init(url: String?) {
		self.url = url
	}
	
	func saveImage() {
		guard let image = image else { return }
		let imageSaver = ImageSaverToLibrary()
		imageSaver.writeToPhotoAlbum(image: image)
		
	}
	
	func fetchImage() {
		guard image == nil && !isLoading else { return }
		guard let url = url, let fetchURL = URL(string: ConstsE.FetchUrlsE.apiURL.rawValue + url) else {
			errorMessage = APIErrorE.badURL.localizedDescription
			return
		}
		isLoading = true
		errorMessage = nil
		
		//print("BeforefetchURL= \(fetchURL)")
		URLSession.shared.dataTask(with: fetchURL) { [weak self] (data, response, error) in
			DispatchQueue.main.async {
				self?.isLoading = false
				if let error = error { self?.errorMessage = error.localizedDescription
				} else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
					self?.errorMessage = APIErrorE.badResponse(statusCode: response.statusCode).localizedDescription
				} else if let data = data, let image = UIImage(data: data) {
					print("fetchURL= \(fetchURL), image= \(image)")
					self?.image = image
				} else {
					self?.errorMessage = APIErrorE.unknown.localizedDescription
				}
			}
		}.resume()
	}
	
	// MARK: Video
	////////////////////
	func saveVideo() {
		DispatchQueue.global(qos: .background).async {
			guard let urlString = self.url,
						let url = URL(string: ConstsE.FetchUrlsE.apiURL.rawValue + urlString),
						let urlData = NSData(contentsOf: url) else { return }
//			if let url = URL(string: url),
//				 let urlData = NSData(contentsOf: url) {
				let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
																																.userDomainMask, true)[0]
				let filePath = "\(documentsPath)/tempFile.mp4"
				DispatchQueue.main.async {
					urlData.write(toFile: filePath, atomically: true)
					Photos.PHPhotoLibrary.shared().performChanges({
						PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(
							fileURLWithPath: filePath))
					}) { completed, error in
						if completed {
							print("Video is saved!")
						} else {
							print("Video not saved! with error= \(String(describing: error?.localizedDescription))")
						}
					}
				}
		}
	} // SaveVideo
	
	// MARK: - Share Image/Video
	func shareWallpaper(image: UIImage) {
		let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
		UIApplication.shared.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
	
		// UIApplication.shared.getRootViewController()
		
		//guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui") else { return }
		//UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
	}
	
	func shareVideoWallpaper() {
		guard let url = url else { return }
		let videoURL = URL(string: ConstsE.FetchUrlsE.apiURL.rawValue + url)

		let activityItems: [Any] = [videoURL as Any, "Share wallpaper link"]
			 let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

		UIApplication.shared.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
	}
	
	
	/////////////////////
//	@Published var isDownloading = false
//	@Published var isDownloaded = false
//
//	func downloadFile() {
//		print("downloadFile")
//		isDownloading = true
//
//		let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//
//		let destinationUrl = docsUrl?.appendingPathComponent("myVideo.mp4")
//		if let destinationUrl = destinationUrl {
//			if (FileManager().fileExists(atPath: destinationUrl.path)) {
//				print("File already exists")
//				isDownloading = false
//			} else {
//				let urlRequest = URLRequest(url: URL(string: "http://159.223.194.4/media/wallpapers/live/forest/6892693.mp4")!)
//
//				let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//
//					if let error = error {
//						print("Request error: ", error)
//						self.isDownloading = false
//						return
//					}
//
//					guard let response = response as? HTTPURLResponse else { return }
//
//					if response.statusCode == 200 {
//						guard let data = data else {
//							self.isDownloading = false
//							return
//						}
//						DispatchQueue.main.async {
//							do {
//								try data.write(to: destinationUrl, options: Data.WritingOptions.atomic)
//
//								DispatchQueue.main.async {
//									self.isDownloading = false
//									self.isDownloaded = true
//								}
//							} catch let error {
//								print("Error decoding: ", error)
//								self.isDownloading = false
//							}
//						}
//					}
//				}
//				dataTask.resume()
//			}
//		}
//	}
//
//	func deleteFile() {
//		let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//
//		let destinationUrl = docsUrl?.appendingPathComponent("myVideo.mp4")
//		if let destinationUrl = destinationUrl {
//			guard FileManager().fileExists(atPath: destinationUrl.path) else { return }
//			do {
//				try FileManager().removeItem(atPath: destinationUrl.path)
//				print("File deleted successfully")
//				isDownloaded = false
//			} catch let error {
//				print("Error while deleting video file: ", error)
//			}
//		}
//	}
//
//	func checkFileExists() {
//		let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//
//		let destinationUrl = docsUrl?.appendingPathComponent("myVideo.mp4")
//		if let destinationUrl = destinationUrl {
//			if (FileManager().fileExists(atPath: destinationUrl.path)) {
//				isDownloaded = true
//			} else {
//				isDownloaded = false
//			}
//		} else {
//			isDownloaded = false
//		}
//	}
//
//	func getVideoFileAsset() -> AVPlayerItem? {
//		let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//
//		let destinationUrl = docsUrl?.appendingPathComponent("myVideo.mp4")
//		if let destinationUrl = destinationUrl {
//			if (FileManager().fileExists(atPath: destinationUrl.path)) {
//				let avAssest = AVAsset(url: destinationUrl)
//				return AVPlayerItem(asset: avAssest)
//			} else {
//				return nil
//			}
//		} else {
//			return nil
//		}
//	}
	
}
