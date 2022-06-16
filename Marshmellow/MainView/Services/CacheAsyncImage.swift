//
//  CacheAsyncImage.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 30.05.2022.
//

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View {
	
	private let url: URL
	private let scale: CGFloat
	private let transaction: Transaction
	private let content: (AsyncImagePhase) -> Content // Protocol 'View' can only be used as a generic constraint because it has Self or associated type requirements
	
	init(url: URL, scale: CGFloat = 1.0, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (AsyncImagePhase) -> Content){
		self.url = url
		self.scale = scale
		self.transaction = transaction
		 self.content = content
	}
	
    var body: some View {
			if let cached = ImageCache[url] {
				let _ = print("cached \(url.absoluteString)")
				content(.success(cached))
			} else {
				let _ = print("request \(url.absoluteString)")
				AsyncImage(url: url, scale: scale, transaction: transaction) { phase in
					cacheAndRender(phase: phase)
				}
			} // else
    } // body
	
	func cacheAndRender(phase: AsyncImagePhase) -> some View {
		if case .success(let image) = phase {
			ImageCache[url] = image
		}
		return content(phase)
	}
	
}

fileprivate class ImageCache {
	static private var cache: [URL: Image] = [:]
	
	static subscript(url: URL) -> Image? {
		get { ImageCache.cache[url] }
		set { ImageCache.cache[url] = newValue }
	}
}

//struct CacheAsyncImage_Previews: PreviewProvider {
//    static var previews: some View {
//			CacheAsyncImage(
//				url: URL(string: "http://167.99.51.18/media/wallpapers/static/Various/4284291.jpg")) { phase in
//						switch phase {
//							case .empty:
//								LottieView(name: "progressView").background(Color.black)
//
//							case .success(let image):
//								image
//									.resizable()
//									.aspectRatio(contentMode: .fill)
//
//							case .failure():
//								Text("Error")
//							default: LottieView(name: "progressView").background(Color.black)
//				}
//    }
//}
//}


