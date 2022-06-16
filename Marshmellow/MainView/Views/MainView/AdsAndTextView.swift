//
//  AdsAndTextView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 28.05.2022.
//

import SwiftUI

struct AdsAndTextView: View {
	
//	var rewardAd: RewardedAds // ??
//
//	init(){
//			 self.rewardAd = RewardedAds()
//	}
	
	var body: some View {

		VStack {
			// MARK: - Текст и Реклама
			VStack(alignment: .leading, spacing: 14) {
				
				Text("Lorem ipsum dolor sit amet?")
					.nunitoFont(name: FontsE.nunitoBold.rawValue)
				
				Text("Pertinax nec, in mei nostrum omittantur. Quo no orem ipsum dolor")
					.nunitoFont()
					.fixedSize(horizontal: false, vertical: true)
					.lineLimit(2)
			}
			.padding(.horizontal)
			
			Rectangle()
				.fill(Color.cGray29)
				.frame(height: 190)
		}.frame(height: 300)
	}
	//.padding(.top, 20)
	

}

struct AdsAndTextView_Previews: PreviewProvider {
	static var previews: some View {
		AdsAndTextView()
	}
}
