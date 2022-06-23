////
////  NativeAd.swift
////  Marshmellow
////
////  Created by Курдин Андрей on 03.06.2022.
////
//
//import SwiftUI
//import GoogleMobileAds
//
//class NativeAdVC: UIViewController, GADNativeAdLoaderDelegate {
//	
//	var adLoader: GADAdLoader!
//	let adUnitId: String
//	
//	init(adUnitId: String) {
//			self.adUnitId = adUnitId
//			super.init(nibName: nil, bundle: nil)
//	}
//	
//	required init?(coder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
//	
//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//		let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
//		multipleAdsOptions.numberOfAds = 5
//
//		adLoader = GADAdLoader(adUnitID: adUnitId, rootViewController: self,
//				adTypes: [.native],
//				options: [multipleAdsOptions])
//		adLoader.delegate = self
//		adLoader.load(GADRequest())
//	}
//
//	func adLoader(_ adLoader: GADAdLoader,
//								didReceive nativeAd: GADNativeAd) {
//		// A native ad has loaded, and can be displayed.
//	}
//	func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
//		// didFailToReceiveAdWithError
//	}
//
//	func adLoaderDidFinishLoading(_ adLoader: GADAdLoader) {
//			// The adLoader has finished loading ads, and a new request can be sent.
//	}
//
//}
//
//extension NativeAdVC: GADNativeAdDelegate {
//	func nativeAdDidRecordClick(_ nativeAd: GADNativeAd) {
//	 print("\(#function) called")
// }
//
// func nativeAdDidRecordImpression(_ nativeAd: GADNativeAd) {
//	 print("\(#function) called")
// }
//
// func nativeAdWillPresentScreen(_ nativeAd: GADNativeAd) {
//	 print("\(#function) called")
// }
//
// func nativeAdWillDismissScreen(_ nativeAd: GADNativeAd) {
//	 print("\(#function) called")
// }
//
// func nativeAdDidDismissScreen(_ nativeAd: GADNativeAd) {
//	 print("\(#function) called")
// }
//
// func nativeAdIsMuted(_ nativeAd: GADNativeAd) {
//	 print("\(#function) called")
// }
//}
//
