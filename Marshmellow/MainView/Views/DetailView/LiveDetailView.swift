//
//  LiveDetailView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 15.06.2022.
//

import SwiftUI

struct LiveDetailView: View {
	//@State private var player = AVPlayer()
	var videoUrl: String // WallpaperCategoryUrlsModel
	
		var body: some View {
			
			LoopingPlayer(url: videoUrl, isLocale: false)
				.edgesIgnoringSafeArea(.all)
//			 VideoPlayer(player: player)
//				.edgesIgnoringSafeArea(.all)
//				.onAppear {
//					if videoUrl.url.first != nil {
//						player = AVPlayer(url: (URL(string: FetchUrlsE.apiURL.rawValue + videoUrl.url)!))
//						player.play()
//					}
//				}
			
		}//body
}

//struct LiveDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveDetailView()
//    }
//}
