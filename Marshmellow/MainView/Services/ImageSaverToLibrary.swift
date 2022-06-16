//
//  ImageSaverToLibrary.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 30.05.2022.
//

import SwiftUI

class ImageSaverToLibrary: NSObject {
	func writeToPhotoAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
	}
	
	@objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
		print("Save finished!")
	}
}
