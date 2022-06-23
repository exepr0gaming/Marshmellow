//
//  BannerAdVC.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 01.06.2022.
//

import SwiftUI
import GoogleMobileAds

class BannerAdVC: UIViewController {
		let adUnitId: String
		
		//Initialize variable
		init(adUnitId: String) {
				self.adUnitId = adUnitId
				super.init(nibName: nil, bundle: nil)
		}
		
		required init?(coder: NSCoder) {
				fatalError("init(coder:) has not been implemented")
		}
		
		var bannerView: GADBannerView = GADBannerView() //Creates your BannerView
		override func viewDidLoad() {
				bannerView.adUnitID = adUnitId
				bannerView.rootViewController = self
			
			adViewDidReceiveAd(bannerView)
			//bannerView(bannerView, didFailToReceiveAdWithError: Error.init(_nsError: NSError))
			
				//Add our BannerView to the VC
				view.addSubview(bannerView)
		}

		override func viewDidAppear(_ animated: Bool) {
				super.viewDidAppear(animated)
				
				loadBannerAd()
		}

		//Allows the banner to resize when transition from portrait to landscape orientation
		override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
				super.viewWillTransition(to: size, with: coordinator)
				coordinator.animate { _ in
						self.bannerView.isHidden = true //So banner doesn't disappear in middle of animation
				} completion: { _ in
						self.bannerView.isHidden = false
						self.loadBannerAd()
				}
		}

		func loadBannerAd() {
				let frame = view.frame.inset(by: view.safeAreaInsets)
				let viewWidth = frame.size.width

				//Updates the BannerView size relative to the current safe area of device (This creates the adaptive banner)
				bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)

				bannerView.load(GADRequest())
		}
	
	
}

extension BannerAdVC: GADBannerViewDelegate {
	
	func adViewDidReceiveAd(_ bannerView: GADBannerView) {
			print("$$$adViewDidReceiveAd")
			if let responseInfo = bannerView.responseInfo {
				print(responseInfo)
			}
	}
	
	func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
			print("$$$didFailToReceiveAdWithError: \(error.localizedDescription)")
			// GADBannerView has the responseInfo property but this demonstrates accessing
			// response info from a returned NSError.
		print("$$$\(error.localizedDescription)")
//			if let responseInfo = error.userInfo[GADErrorUserInfoKeyResponseInfo] as? GADResponseInfo {
//				print(responseInfo)
//			}
	}
	
}
