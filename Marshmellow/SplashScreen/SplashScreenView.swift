//
//  SplashScreenView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 19.05.2022.
//

import SwiftUI
import Lottie
import AppTrackingTransparency

struct SplashScreenView: View {
	
	@State private var isActive = false
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@EnvironmentObject var adMobService: AdMobService
	
	//init() { adMobService.adStarted() }
	
    var body: some View {
			
//			if wallpapersFetcher.isLoading {
//				//LoadingView()
//			} else if wallpapersFetcher.errMessage != nil {
//				ErrorView()
//			} else {
//				// all content from bottom
//			}
			
			// MARK: - TO-DO changes
			if isActive {
				ConnectingToDBView()
					.preferredColorScheme(.dark)
				
			} else if wallpapersFetcher.errMessage != nil {
				ErrorView()
			} else {
				
				ZStack {
				
					Image(UIDevice.isIPhone ? "bgIPhone" : "bgIPad")
						.resizable()
						.scaledToFill()
					
					VStack {
						LottieView(name: "splash", loopMode: .loop)
							//.frame(maxHeight: 122) // 144 for ipad
						
						Spacer()
						
						Image(UIDevice.isIPhone ? "man1" : "ipad1")
							.resizable()
							.aspectRatio(contentMode: .fill)
//							.frame(width: getScreenBounds().width, height: getScreenBounds().height * 0.66)
							
					}
					.padding(.top, UIScreen.screenHeight / 6)
					.onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
						DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
										if #available(iOS 14, *) {
												ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
														DispatchQueue.main.async {
//																	self.bannerView.load(GADRequest())
//																	self.interstitial.load(request)
															withAnimation { self.isActive = true }
														}
												})
										} else {
												// Fallback on earlier versions
										}
								}
					}
//					.onAppear {
//						DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//							withAnimation {
//								self.isActive = true
//							}
//						}
//					}
				
			}
			.ignoresSafeArea()
			.background(Color.black)
		} // else
			
			
				
				
			
    }
	
//	func requestDataPermission() {
//			if #available(iOS 14, *) {
//					ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
//							switch status {
//							case .authorized:
//									// Tracking authorization dialog was shown
//									// and we are authorized
//									print("Authorized")
//							case .denied:
//									// Tracking authorization dialog was
//									// shown and permission is denied
//									print("Denied")
//							case .notDetermined:
//									// Tracking authorization dialog has not been shown
//									print("Not Determined")
//							case .restricted:
//									print("Restricted")
//							@unknown default:
//									print("Unknown")
//							}
//					})
//			} else {
//					//you got permission to track, iOS 14 is not yet installed
//			}
//	}
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
