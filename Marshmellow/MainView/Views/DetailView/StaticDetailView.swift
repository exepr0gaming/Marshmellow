//
//  StaticDetailView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 15.06.2022.
//

import SwiftUI

struct StaticDetailView: View {
	
	@ObservedObject var imageLoader: ImageLoader
	
//	init(wallpaperURL: String?) {
//		self._imageLoader = StateObject(wrappedValue: ImageLoader(url: wallpaperURL))
//	}
	
	var body: some View {
		VStack {
			if imageLoader.image != nil {
				Image(uiImage: imageLoader.image!)
					.resizable()
					.scaledToFill()
					.ignoresSafeArea()
				
			} else if imageLoader.errorMessage != nil {
				VStack {
					Image("ConnectingDataBaseLogo")
						.resizable()
						.scaledToFit()
						.frame(maxHeight: 100)
					Text(imageLoader.errorMessage!).foregroundColor(.white)
				}.background(Color.black)
			} else {
				LottieView(name: "progressView").background(Color.black)
			}
		}
		.onAppear(perform: {
			imageLoader.fetchImage()
		})
	}
	
}
