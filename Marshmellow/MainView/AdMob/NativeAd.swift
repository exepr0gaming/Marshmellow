//
//  NativeAD.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 03.06.2022.
//

import SwiftUI

struct NativeAd: UIViewControllerRepresentable {
			let adUnitId: String
			
			init(adUnitId: String) {
					self.adUnitId = adUnitId
			}
	
			func makeUIViewController(context: Context) -> NativeAdVC {
					return NativeAdVC(adUnitId: adUnitId)
			}

			func updateUIViewController(_ uiViewController: NativeAdVC, context: Context) {
					
			}
	
//	func makeCoordinator() -> Coordinator {
//				print("@@@makeCoordinator On")
//				return Coordinator()
//			} // ??
//
//		// ??
//		class Coordinator: NSObject, GADBannerViewDelegate {
//			func adViewDidReceiveAd(_ bannerView: GADBannerView) {
//				print("@@@Banner adapter class name: \(bannerView.responseInfo?.adNetworkClassName ?? "###")")
//			}
//			func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
//				print("@@@bannerViewDidReceiveAd")
//			}
//
//			func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
//				print("@@@bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
//			}
//
//			func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
//				print("@@@bannerViewDidRecordImpression")
//			}
//
//			func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
//				print("@@@bannerViewWillPresentScreen")
//			}
//
//			func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
//				print("@@@bannerViewWillDIsmissScreen")
//			}
//
//			func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
//				print("@@@bannerViewDidDismissScreen")
//			}
//		}
}
