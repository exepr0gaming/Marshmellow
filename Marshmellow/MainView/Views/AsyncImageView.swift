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
	
//	var frameWidth: CGFloat
//	var frameHeight: CGFloat
	
    var body: some View {
      
			AsyncImage(url: URL(string: "http://167.99.51.18" + imageStr)) { phase in
				switch phase {
						
					case .empty:
						VStack {
							Text("Image is loaded.").font(.largeTitle).foregroundColor(.white)
							LottieView(name: "progressView")
								.background(Color.black)
						}
						
						// An image succesfully loaded.
					case .success(let image):
						image
							.resizable()
							//.scaledToFit()
							.aspectRatio(contentMode: contentMode)
						
					case .failure(let error):
						Text("An image failed to load with an error- \(error.localizedDescription)")
						
					default: LottieView(name: "progressView").background(Color.black)
				}
			}
			
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
			AsyncImageView(imageStr: "/media/space.jpg")
    }
}
