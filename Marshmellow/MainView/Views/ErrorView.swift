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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
			ErrorView(wallpapers: WallpapersFetcher())
    }
}
