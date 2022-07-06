//
//  AsyncImageView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

struct AsyncImageView: View {
	
	var imageStr: String
	var contentMode: ContentMode = .fill
	@State var imageForSave: Image = Image("")
	
	//var frameWidth: CGFloat = 174
	//var frameHeight: CGFloat = 310
	//var cornerRadius: CGFloat = 6
	
	var body: some View {
		let imageUrl = imageStr.replacingOccurrences(of: " ", with: "%20")
		// CacheAsyncImage
		AsyncImage(url: URL(string: ConstsE.FetchUrlsE.apiURL.rawValue + imageUrl) ?? URL(fileURLWithPath: "ConnectingDataBaseLogo")) { phase in
			
			switch phase {
				case .empty:
					//VStack {Text("Image is loaded.").fontWeight(.light).foregroundColor(.white)	}
					LottieView(name: "progressView").background(Color.black)
					
				case .success(let image):
					image
						.resizable()
						.aspectRatio(contentMode: contentMode)
					//.frame(width: frameWidth, height: frameHeight)
					//.cornerRadius(cornerRadius)
						
					
				case .failure(_): // let error
					// try to load, if cancelled
										//CacheAsyncImage(url: URL(string: ConstsE.FetchUrlsE.apiURL.rawValue + imageStr) ?? URL(fileURLWithPath: "ConnectingDataBaseLogo")) { phase in
					AsyncImage(url: URL(string: ConstsE.FetchUrlsE.apiURL.rawValue + imageStr) ?? URL(fileURLWithPath: "ConnectingDataBaseLogo")) { phase in
											if let image = phase.image {
												image
													.resizable()
													.aspectRatio(contentMode: contentMode)
											} else {
												Image("ConnectingDataBaseLogo")
													.resizable()
													.scaledToFit()
											}
					}
//					VStack {
//						Image(systemName: "xmark.octagon.fill")
//						Text("An image failed to load with an error- \(error.localizedDescription)")
//					}
				default: LottieView(name: "progressView").background(Color.black)
			}
		}
		
	}
//	 func saveImageForDownload(image: Image) {
//		self.imageForSave = image
//	}

}

struct AsyncImageView_Previews: PreviewProvider {
	static var previews: some View {
		AsyncImageView(imageStr: "/media/space.jpg").environmentObject(WallpapersFetcher())
	}
}
