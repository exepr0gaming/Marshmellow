////
////  FileHandler.swift
////  Marshmellow
////
////  Created by Курдин Андрей on 21.06.2022.
////
//
//import Foundation
//
//class FileHandler {
//		private(set) var imageFileUrl: URL?
//		private(set) var videoFileUrl: URL?
//
//		init() {
//				imageFileUrl = getDocumentsDirectory().appendingPathComponent("image.jpg")
//				videoFileUrl = getDocumentsDirectory().appendingPathComponent("video.mov")
//		}
//
//		func removeExistingFiles() {
//				removeFile(at: imageFileUrl!)
//				removeFile(at: videoFileUrl!)
//		}
//
//		private func removeFile(at url: URL) {
//				do {
//						try FileManager.default.removeItem(at: url)
//				} catch {
//						print(error)
//				}
//		}
//
//		private func getDocumentsDirectory() -> URL {
//				let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//				return paths[0]
//		}
//}
