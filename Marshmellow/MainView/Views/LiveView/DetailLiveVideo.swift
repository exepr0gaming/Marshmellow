////
////  DetailLiveVideo.swift
////  Marshmellow
////
////  Created by Курдин Андрей on 07.06.2022.
////
//
//import SwiftUI
//import AVKit
//
//struct DetailLiveVideo: View {
//	
//	@State private var player = AVPlayer()
//	var videoUrl: WallpaperCategoryUrlsModel
//	
//    var body: some View {
//			
//       VideoPlayer(player: player)
//				.edgesIgnoringSafeArea(.all)
//				.onAppear {
//					if videoUrl.url.first != nil {
//						player = AVPlayer(url: (URL(string: "http://159.223.194.4" + videoUrl.url)!))
//						player.play()
//					}
//				}
//			
//    }//body
//}
//
////struct DetailLiveVideo_Previews: PreviewProvider {
////    static var previews: some View {
////        DetailLiveVideo()
////    }
////}
