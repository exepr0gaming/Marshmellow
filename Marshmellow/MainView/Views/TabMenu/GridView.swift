//
//  GridView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 23.05.2022.
//

import SwiftUI

//let gridList = (1...4).map { }

struct GridView: View {
	
	var wallpaperCategory: String
	@ObservedObject var wallpaperFetcher: WallpapersFetcher
	
	//@State var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
	@State var gridLayout = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)
	
    var body: some View {
			LazyVGrid(columns: gridLayout, spacing: 5) {
				ForEach(wallpaperFetcher.wallpaperCategory, id: \.self) { item in
					AsyncImageView(imageStr: item.url, contentMode: .fill)
						.frame(height: 310)
						.cornerRadius(8)
						//.padding(.horizontal, -1) // хз почему там spacing больше на 1
//					Image(item.url)
//						.resizable()
						//.scaledToFill()
						//.frame(minWidth: 0, maxWidth: .infinity) // getScreenBounds().width / 4
				}
			}
			.background(Color.black)
			.onAppear {
				wallpaperFetcher.fetchWallpaperCategory(linkCategory: wallpaperCategory)
				print("\(wallpaperFetcher.wallpaperCategory)")
			}
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
			GridView(wallpaperCategory: "/api/wallpapers/static/1", wallpaperFetcher: WallpapersFetcher())
    }
}
