//
//  ErrorView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

struct ErrorView: View {
	
	@ObservedObject var wallpapers: WallpapersFetcher
	
    var body: some View {
			VStack {
				Text(wallpapers.errMessage ?? "")
					.font(.largeTitle)
			}
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
			ErrorView(wallpapers: WallpapersFetcher())
    }
}
