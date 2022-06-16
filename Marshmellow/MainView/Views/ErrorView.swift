//
//  ErrorView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

struct ErrorView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	
    var body: some View {
			VStack {
				LottieView(name: "connectingBlack")
				
				Text(wallpapersFetcher.errMessage ?? "")
					.font(.largeTitle)
				
				Button {
					Task.init {
						await wallpapersFetcher.fetchAllWallpapers()
					}
				} label: {
					Text("Try again")
				}

			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.ignoresSafeArea()
			.background(Color.black)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
			ErrorView().environmentObject(WallpapersFetcher())
    }
}
