////
////  LivePhotoPresenter.swift
////  Marshmellow
////
////  Created by Курдин Андрей on 21.06.2022.
////
//
//import Foundation
//import Photos
//
//class MainPresenter {
//		//let fileHandler = FileHandler()
//		let videoConverter = VideoToLivePhotoConverter()
//
//		private var filePath: URL?
//
//		func generateLivePhoto(onCompletion: @escaping (PHLivePhoto?) -> Void) {
//				let imageName = "img2s"
//				let videoURL = Bundle.main.url(forResource: imageName, withExtension: "mov")!
//				videoConverter.convertVideoToLive(videoURL: videoURL) { photo in
//						if photo != nil {
//								onCompletion(photo!)
//						}
//				}
//		}
//
//}
