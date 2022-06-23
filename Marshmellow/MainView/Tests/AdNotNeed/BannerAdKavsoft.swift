//
//  BannerAdKavsoft.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 02.06.2022.
//

import SwiftUI
import GoogleMobileAds

struct BannerAdKavsoft: UIViewRepresentable {
	
			let adUnitId: String
			
//			init(adUnitId: String) {
//					self.adUnitId = adUnitId
//			}
			
	func makeCoordinator() -> Coordinator {
		print("###makeCoordinator On")
		return Coordinator()
	}
	func makeUIView(context: Context) -> GADBannerView {
		let adView = GADBannerView(adSize: GADAdSizeBanner)
		adView.adUnitID = adUnitId
		adView.rootViewController = UIApplication.shared.getRootViewController()
		adView.delegate = context.coordinator
		adView.load(GADRequest())
		return adView
	}
	func updateUIView(_ uiView: GADBannerView, context: Context) {
		
	}
	
	class Coordinator: NSObject, GADBannerViewDelegate {
		func adViewDidReceiveAd(_ bannerView: GADBannerView) {
			print("###Banner adapter class name: \(bannerView.responseInfo?.adNetworkClassName ?? "###")")
		}
//		func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
//			print("###bannerViewDidReceiveAd")
//		}

		func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
			print("###bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
		}

		func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
			print("###bannerViewDidRecordImpression")
		}

		func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
			print("###bannerViewWillPresentScreen")
		}

		func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
			print("###bannerViewWillDIsmissScreen")
		}

		func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
			print("###bannerViewDidDismissScreen")
		}
	}
}


