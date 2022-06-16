//
//  EmptyGridView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 07.06.2022.
//

import SwiftUI

struct EmptyGridView: View {
	
//	let flexibleLayout: [GridItem] = [.init(.flexible(minimum: 174, maximum: 400), spacing: 5), .init(.flexible(minimum: 174, maximum: 400), spacing: 5)]
//	@State var index: Int
//
//	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher

	var body: some View {
		
		Color.clear
			//.frame(width: getScreenBounds().width)
		
//		if wallpapersFetcher.selectedLiveIndex == index {
//			ScrollView(.vertical, showsIndicators: false) {
//				ForEach(0..<3) { block in
//					LazyVGrid(columns: flexibleLayout, spacing: 5) {
//						ForEach(0..<4, id: \.self) { item in
//								Image("gridItemPng")
//								.resizable().scaledToFill()
//						}
//					}
//					Color.cYellow.frame(width: getScreenBounds().width, height: 200)
//				}
//			}
//		} else {
//			Color.cGreen
//				.frame(height: 50)
//			.frame(width: getScreenBounds().width)
//			Spacer()
//		}
			
		
		
//		if wallpapersFetcher.selectedLiveIndex > 3 {
//			ScrollView(.vertical, showsIndicators: false) {
//				ForEach(0..<3) { block in
//					LazyVGrid(columns: flexibleLayout, spacing: 5) {
//						ForEach(0..<4, id: \.self) { item in
//								Image("gridItemPng")
//								.resizable().scaledToFill()
//						}
//					}
//					Color.cYellow.frame(width: getScreenBounds().width, height: 200)
//				}
//			}
//			.onAppear { print("WTF, go!") }
//		} else {
//			Color.cGreen
//				.frame(height: 50)
//			.frame(width: getScreenBounds().width)
//		}
		
		
//		ScrollView(.vertical, showsIndicators: false) {
//			ForEach(0..<wallpapersFetcher.categoryUrls.count / 4) { block in
//				LazyVGrid(columns: flexibleLayout, spacing: 5) {
//					ForEach(wallpapersFetcher.categoryUrls[(block * 4) ..< ((block + 1) * 4)], id: \.self) { item in
//						NavigationLink {
//							DetailWallpaperView(wallpaperURL: item.previewUrl)
//						} label: {
//
//							AsyncImageView(imageStr: item.previewUrl, contentMode: .fill)
//								.frame(height: 310)
//								.cornerRadius(6)
//						}
//					}
//				}
//			}
//		}.frame(width: getScreenBounds().width).background(Color.black)
		
		
		

	
		//.background(Color.black)
	}
	
}



//struct EmptyGridView_Previews: PreviewProvider {
//	static var previews: some View {
//		EmptyGridView(index: 1)
//	}
//}
