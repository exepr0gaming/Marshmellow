////
////  NativeAdView.swift
////  Marshmellow
////
////  Created by Курдин Андрей on 03.06.2022.
////
//
//import SwiftUI
//import GoogleMobileAds
//import UIKit
//import GoogleUtilities_AppDelegateSwizzler
//import GoogleMobileAdsTarget
//import GoogleUtilities_Logger
//import GoogleUtilities_Network
//import GoogleAppMeasurementTarget
//import GoogleUtilities_Environment
//import GoogleUtilities_Reachability
//import GoogleUtilities_NSData
//import GoogleUtilities_MethodSwizzler
//
//final class NativeMediaView: UIViewRepresentable {
//
//var mediaView: GADMediaContent
//
//init(mediaView: GADMediaContent){
//		self.mediaView = mediaView
//}
//
//typealias UIViewType = GADMediaView
//
//func makeUIView(context: Context) -> GADMediaView {
//		let view = GADMediaView(frame: .zero)
//		return view
//}
//
//func updateUIView(_ uiView: GADMediaView, context: Context) {
//		uiView.mediaContent = self.mediaView
//		uiView.frame(forAlignmentRect: CGRect(origin: .zero, size: CGSize(width: 250, height: 150)))
//}
//}
//
//final class NativeViewController: UIViewControllerRepresentable {
//
//let adUnitID: String
//@Binding var adStatus: AdStatus
//
//var adLoader: GADAdLoader?
//
//init(adUnitID: String, adStatus: Binding<AdStatus>){
//		self.adUnitID = adUnitID
//		self._adStatus = adStatus
//}
//
//func makeCoordinator() -> Coordinator {
//		Coordinator(nativeViewController: self)
//}
//
//func makeUIViewController(context: Context) -> UIViewController {
//		let viewController = UIViewController()
//		
//		let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
//		multipleAdsOptions.numberOfAds = 1
//		
//		adLoader = GADAdLoader(adUnitID: self.adUnitID, rootViewController: viewController, adTypes: [GADAdLoaderAdType.native], options: [multipleAdsOptions])
//		adLoader?.delegate = context.coordinator
//		adLoader?.load(GADRequest())
//		
//		let testLabel = NativeAdView()
//		viewController.view.addSubview(testLabel)
//		
//		return viewController
//}
//
//func imageOfStars(from starRating: NSDecimalNumber?) -> UIImage? {
//		guard let rating = starRating?.doubleValue else {
//				return nil
//		}
//		if rating >= 5 {
//				return UIImage(named: "stars_5")
//		} else if rating >= 4.5 {
//				return UIImage(named: "stars_4_5")
//		} else if rating >= 4 {
//				return UIImage(named: "stars_4")
//		} else if rating >= 3.5 {
//				return UIImage(named: "stars_3_5")
//		} else {
//				return nil
//		}
//}
//
//func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//		
//		print("STA => \(self.adStatus)")
//		if self.adStatus == .success {
//				let nativeAd = context.coordinator.nativeAd
//				
//				let nativeAdView = GADNativeAdView()
//				(nativeAdView.headlineView as? UILabel)?.text = nativeAd?.headline
//				
//				(nativeAdView.bodyView as? UILabel)?.text = nativeAd?.body
//				nativeAdView.bodyView?.isHidden = nativeAd?.body == nil
//				
//				(nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd?.callToAction, for: .normal)
//				nativeAdView.callToActionView?.isHidden = nativeAd?.callToAction == nil
//				
//				(nativeAdView.iconView as? UIImageView)?.image = nativeAd?.icon?.image
//				nativeAdView.iconView?.isHidden = nativeAd?.icon == nil
//				
//				(nativeAdView.advertiserView as? UILabel)?.text = nativeAd?.advertiser
//				nativeAdView.advertiserView?.isHidden = nativeAd?.advertiser == nil
//				nativeAdView.callToActionView?.isUserInteractionEnabled = false
//				nativeAdView.nativeAd = nativeAd
//				nativeAdView.translatesAutoresizingMaskIntoConstraints = false
//				
//				uiViewController.removeFromParent()
//				uiViewController.view.addSubview(nativeAdView)
//
//		}
//		
//}
//
//class Coordinator: NSObject, GADNativeAdLoaderDelegate {
//		
//		var nativeViewController: NativeViewController
//		var nativeAd: GADNativeAd?
//		
//		init(nativeViewController: NativeViewController){
//				self.nativeViewController = nativeViewController
//		}
//		
//		func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
//				self.nativeAd = nativeAd
//				self.nativeViewController.adStatus = .success
//		}
//		
//		func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
//				self.nativeViewController.adStatus = .failure
//		}
//}
//}
//
//final class NativeViewController2: NSObject, GADNativeAdLoaderDelegate {
//@Binding var adStatus: AdStatus
//
//var adLoader: GADAdLoader?
//var nativeAd: GADNativeAd?
//
//init(adStatus: Binding<AdStatus> = .constant(AdStatus.loading)){
//		self._adStatus = adStatus
//}
//
//func loadAd(adStatus: Binding<AdStatus>){
//		self._adStatus = adStatus
//		
//		let options = GADNativeAdMediaAdLoaderOptions()
//		options.mediaAspectRatio = .square
//		
//		let root = UIApplication.shared.windows.first?.rootViewController
//		
//		adLoader = GADAdLoader(adUnitID: "ca-app-pub-3940256099942544/3986624511", rootViewController: root!, adTypes: [GADAdLoaderAdType.native], options: [options])
//		adLoader?.delegate = self
//		adLoader?.load(GADRequest())
//}
//
//func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
//		self.nativeAd = nativeAd
//		self.adStatus = .success
//}
//
//func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
//		self.adStatus = .failure
//}
//
//func nativeAds() -> GADNativeAd? {
//		self.nativeAd
//}
