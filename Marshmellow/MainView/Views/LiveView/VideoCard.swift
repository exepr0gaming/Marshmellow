//
//  VideoCard.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 07.06.2022.
//

import SwiftUI
import AVFoundation

struct VideoCard: View {
	var videoUrl: WallpaperCategoryUrlsModel
	
	@State private var player = AVPlayer()
	
    var body: some View {
			ZStack {
				ZStack(alignment: .bottomLeading) {
					AsyncImage(url: URL(string: "http://159.223.194.4" + videoUrl.previewUrl)) { image in
						image.resizable().aspectRatio(contentMode: .fill).frame(width: 160, height: 250).cornerRadius(30)
					} placeholder: {
						Rectangle().foregroundColor(.gray.opacity(0.3)).frame(width: 160, height: 250).cornerRadius(30)
					}
				}

				Image(systemName: "play.fill").foregroundColor(.white).font(.title).padding().background(.ultraThinMaterial).cornerRadius(50)
			}
			
			// MARK: - Video
//			ZStack(alignment: .bottomLeading) {
//				VideoPlayer(player: player)
//				.aspectRatio(contentMode: .fill)
//				.frame(height: 310).cornerRadius(8)
//			}
//			.onAppear {
//				if videoUrl.url.first != nil {
//					player = AVPlayer(url: (URL(string: "http://159.223.194.4" + videoUrl.url)!))
//					player.play()
//				}
//			}
			
//			LoopingPlayer(url: videoUrl.url, isLocale: false) // , isLocale: false
//				.frame(height: 310).cornerRadius(8)
    }
}

//struct LoopingVideoPlayer: UIViewRepresentable {
//	var url: String
//	func updateUIView(_ uiView: UIView, context: Context) {}
//	func makeUIView(context: Context) -> UIView {
//		//return QueuePlayerUIViewC(frame: .zero, url: url)
//		return QueuePlayerUIViewC(frame: .zero, url: url)
//		}
//}
//
//class QueuePlayerUIViewC: UIView {
//	private var playerLayer = AVPlayerLayer()
//	private var playerLooper: AVPlayerLooper?
//	var url: String
//
//	 init(frame: CGRect, url: String) {
//		 self.url = url
//		 super.init(frame: frame)
//
//		// Load Video
//		 guard let fileUrl = URL(string: "http://159.223.194.4" + url) else { return }
//		 let playerItem = AVPlayerItem(url: fileUrl)
//
//		// Setup Player
//		let player = AVQueuePlayer(playerItem: playerItem)
//		playerLayer.player = player
//		playerLayer.videoGravity = .resizeAspectFill
//		layer.addSublayer(playerLayer)
//
//		// Loop
//		playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
//
//		// Play
//		player.play()
//
//	} // override init
//
//	override func layoutSubviews() {
//		super.layoutSubviews()
//		playerLayer.frame = bounds
//	}
//
//	required init?(coder: NSCoder) {
//		fatalError("init(coder: has not been implemented")
//	}
//
//
//}


//struct VideoCard_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoCard()
//    }
//}
