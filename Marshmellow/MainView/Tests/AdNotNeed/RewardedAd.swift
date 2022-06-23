//
//  RewardedAd.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 01.06.2022.
//

import SwiftUI
import GoogleMobileAds

class RewardedAd: NSObject {
		var rewardedAd: GADRewardedAd?
		
		static let shared = RewardedAd()
		
		func loadAd(withAdUnitId id: String) {
				let req = GADRequest()
				GADRewardedAd.load(withAdUnitID: id, request: req) { rewardedAd, err in
						if let err = err {
								print("Failed to load RewardedAd ad with error: \(err)")
								return
						}
						
						self.rewardedAd = rewardedAd
				}
		}
}
