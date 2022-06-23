//
//  FullScreenModifier.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 02.06.2022.
//

import SwiftUI

enum ConstsE {
	
	enum Metrica: String {
		case yandexMetrica = "f1f983cd-4255-4a7c-a94e-cb2ac05a00d2"
	}
	
	enum ADMobE: String {
		case testRewardedId = "ca-app-pub-3940256099942544/1712485313"
		case testInterstitialId = "ca-app-pub-3940256099942544/4411468910"
		case testBannerId = "ca-app-pub-3940256099942544/2934735716"
		case testNativeId = "ca-app-pub-3940256099942544/3986624511"
	}
}


struct FullScreenModifier<Parent: View>: View {
	@Binding var isPresented: Bool
 @State var adType: AdType
	
 //Select adType
 enum AdType {
		 case interstitial
		 case rewarded
 }
 
 var rewardFunc: () -> Void
 var adUnitId: String

 //The parent is the view that you are presenting over
 //Think of this as your presenting view controller
 var parent: Parent
 
 var body: some View {
		 ZStack {
				 parent
				 
				 if isPresented {
//						 EmptyView()
//								 .edgesIgnoringSafeArea(.all)
						 
						 if adType == .rewarded {
								 RewardedAdView(isPresented: $isPresented, adUnitId: adUnitId, rewardFunc: rewardFunc)
										 .edgesIgnoringSafeArea(.all)
						 } else if adType == .interstitial {
								 InterstitialAdView(isPresented: $isPresented, adUnitId: adUnitId)
						 }
				 }
		 }
		 .onAppear {
				 //Initialize the ads as soon as the view appears
				 if adType == .rewarded {
						 RewardedAd.shared.loadAd(withAdUnitId: adUnitId)
				 } else if adType == .interstitial {
						 InterstitialAd.shared.loadAd(withAdUnitId: adUnitId)
				 }
		 }
 }
}
