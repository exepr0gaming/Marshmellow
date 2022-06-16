//
//  TestAdmob.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 02.06.2022.
//

import SwiftUI
import GoogleMobileAds

struct TestAdmob: View {
	
	@State var showRewardedAd: Bool = false
	@State var showIntersitialAd: Bool = false
	@State var rewardGranted: Bool = false
	
	let testRewardedId = "ca-app-pub-3940256099942544/1712485313"
	let testInterstitialId = "ca-app-pub-3940256099942544/4411468910"
	let testBannerId = "ca-app-pub-3940256099942544/2934735716"
	//let testNativeId = "ca-app-pub-3940256099942544/3986624511"
	
	//var testRewardedId = "ca-app-pub-3940256099942544/1458002511"
	// ca-app-pub-9960448420546325~2026784928
	
	
	var body: some View {
		ZStack {
			VStack {
				Spacer()
//				if rewardGranted {
//					Text("Here's a gift 🎁")
//				} else {
//					Button("Get a Reward") {
//						showRewardedAd.toggle()
//					}
//				}
//
//				Button("Show Interstitial Ad") {
//					showIntersitialAd.toggle()
//				}
//				.padding()
//				.foregroundColor(Color(.systemPurple))
				
				
				VStack {
					NativeAdViewRepresentable()
						.frame(width: getScreenBounds().width, height: 282)
				}
				
				.background(Color.white.opacity(0.75))
//				VStack {
//					Text("BannerAdKavsoft Start")
//					BannerAdKavsoft(adUnitId: testBannerId)
//					Text("BannerAdKavsoft End")
//					NativeAdViewRepresentable(adUnitId: testNativeId)
//					//NativeAdViewRepresentable()
//					Text("BannerAdView Start")
//					BannerAdView(adPosition: .bottom, adUnitId: testBannerId)
//					Text("BannerAdView End")
//				}
				
				Spacer()
			}
			
			
		}
		.presentRewardedAd(isPresented: $showRewardedAd, adUnitId: testRewardedId) {
			print("Reward Granted")
			rewardGranted.toggle()
		}
		.presentInterstitialAd(isPresented: $showIntersitialAd, adUnitId: testInterstitialId)
	}
	
}

struct TestAdmob_Previews: PreviewProvider {
	static var previews: some View {
		TestAdmob()
	}
}
