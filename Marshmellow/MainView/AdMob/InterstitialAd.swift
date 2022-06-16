//
//  InterstitialAd.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 01.06.2022.
//

import SwiftUI
import GoogleMobileAds

class InterstitialAd: NSObject {
		var interstitialAd: GADInterstitialAd?
	
		
		//Want to have one instance of the ad for the entire app
		//We can do this b/c you will never show more than 1 ad at once so only 1 ad needs to be loaded
		static let shared = InterstitialAd()
		
		func loadAd(withAdUnitId id: String) {
				let req = GADRequest()
				GADInterstitialAd.load(withAdUnitID: id, request: req) { interstitialAd, err in // [self]
						if let err = err {
							print("Failed to load interstitial ad with error: \(err.localizedDescription)")
								return
						}
						
						self.interstitialAd = interstitialAd
				}
		}
}


// class @@@: UIViewController ??? NSObject {
	// func loadAd ??? override func viewDidLoad() {
