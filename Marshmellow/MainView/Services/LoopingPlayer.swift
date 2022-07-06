//
//  LoopingPlayer.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 24.05.2022.
//

import SwiftUI
import AVFoundation

struct LoopingPlayer: UIViewRepresentable {
	var url: String
	var isLocale: Bool
	func updateUIView(_ uiView: UIView, context: Context) {}
	func makeUIView(context: Context) -> UIView {
		return QueuePlayerUIView(frame: .zero, url: url, isLocale: isLocale)
	}
}

class QueuePlayerUIView: UIView {
	private var playerLayer = AVPlayerLayer()
	private var playerLooper: AVPlayerLooper?
	var url: String
	var isLocale: Bool
	
	//	private var fileUrl: URL = Bundle.main.url(forResource: "live", withExtension: "mp4")!
	
	init(frame: CGRect, url: String, isLocale: Bool) {
		self.url = url
		self.isLocale = isLocale
		super.init(frame: frame)
		
		// Load Video
		let fileUrl = (!isLocale
									 ? URL(string: ConstsE.FetchUrlsE.apiURL.rawValue + url)
									 : Bundle.main.url(forResource: url, withExtension: "mp4"))!
		
		let playerItem = AVPlayerItem(url: fileUrl)
		// Setup Player
		let player = AVQueuePlayer(playerItem: playerItem)
		playerLayer.player = player
		playerLayer.videoGravity = .resizeAspectFill
		layer.addSublayer(playerLayer)
		
		// Loop
		playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
		
		// Play
		player.play()
		
	} // override init
	
	override func layoutSubviews() {
		super.layoutSubviews()
		playerLayer.frame = bounds
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder: has not been implemented")
	}
	
	
}


struct LoopingPlayer_Previews: PreviewProvider {
	static var previews: some View {
		LoopingPlayer(url: "live", isLocale: false)
	}
}
