//
//  BannerAd.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 01.06.2022.
//

import SwiftUI
import GoogleMobileAds

final class BannerAd: UIViewControllerRepresentable {
		let adUnitId: String
		
		init(adUnitId: String) {
				self.adUnitId = adUnitId
		}
		
	func makeCoordinator() -> Coordinator {
		print("@@@makeCoordinator On")
		return Coordinator()
	} // ??
		
		func makeUIViewController(context: Context) -> BannerAdVC {
				return BannerAdVC(adUnitId: adUnitId)
		}

		func updateUIViewController(_ uiViewController: BannerAdVC, context: Context) {
				
		}
	
	// ??
	class Coordinator: NSObject, GADBannerViewDelegate {
		func adViewDidReceiveAd(_ bannerView: GADBannerView) {
			print("@@@Banner adapter class name: \(bannerView.responseInfo?.adNetworkClassName ?? "###")")
		}
		func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
			print("@@@bannerViewDidReceiveAd")
		}

		func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
			print("@@@bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
		}

		func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
			print("@@@bannerViewDidRecordImpression")
		}

		func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
			print("@@@bannerViewWillPresentScreen")
		}

		func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
			print("@@@bannerViewWillDIsmissScreen")
		}

		func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
			print("@@@bannerViewDidDismissScreen")
		}
	}
}



