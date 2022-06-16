//////
//////  GADNativeViewController.swift
//////  AdmobNativeSample
//////
//////  Created by Sakura on 2021/05/07.
//////
////
//import SwiftUI
//import GoogleMobileAds
//
//struct NativeView: View {
//	@State var adStatus: AdStatus = .loading
//	
//	var nativeViewController = NativeViewController2()
//	
//	var body: some View {
//		VStack {
//			if adStatus == .success {
//				if let nativeAd = nativeViewController.nativeAds() {
//					NativeAdViewRepresentable(nativeAd: nativeAd)
//						.frame(maxWidth: 375)
//				}
//			}
//			else {
//				ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
//					.progressViewStyle(CircularProgressViewStyle())
//				
//				Text("Loading ad")
//					.foregroundColor(.secondary)
//			}
//		}
//		.onAppear {
//			nativeViewController.loadAd(adStatus: $adStatus)
//		}
//	}
//}
//
//struct NativeAdView: View {
//	
//	var nativeAd: GADNativeAd
//	
//	var body: some View {
//		VStack {
//			HStack {
//				Text("Advertisement")
//					.font(.system(size: 12, weight: .semibold, design: .rounded))
//					.padding(.horizontal, 5)
//					.foregroundColor(.white)
//					.background(
//						RoundedRectangle(cornerRadius: 5)
//							.fill(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
//					)
//				
//			}
//			.padding(.horizontal, 15)
//			.padding(.top, 10)
//			
//			HStack {
//				Image(uiImage: (nativeAd.icon?.image)!)
//					.resizable()
//					.scaledToFill()
//					.frame(width: 60, height: 60)
//					.mask(Circle())
//				
//				VStack(alignment: .leading) {
//					Text(nativeAd.headline!)
//						.fontWeight(.semibold)
//						.fixedSize(horizontal: false, vertical: true)
//						.font(.title3)
//						.lineLimit(2)
//						.multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
//						.lineSpacing(1)
//					
//					Text(nativeAd.advertiser ?? "Advert")
//						.font(.subheadline)
//				}
//				Spacer()
//			}
//			.padding(.horizontal, 15)
//			
//			HStack {
//				Text(nativeAd.body!)
//					.multilineTextAlignment(.leading)
//				Spacer()
//			}
//			.padding(.horizontal, 15)
//			
//			HStack(spacing: 15) {
//				Spacer()
//				Text(nativeAd.price ?? "")
//					.multilineTextAlignment(.leading)
//				
//				HStack {
//					ForEach(0..<Int(truncating: nativeAd.starRating ?? 0)) { _ in
//						Image(systemName: "star")
//					}
//				}
//				
//				if let cTA = nativeAd.callToAction {
//					Button(action: {
//						
//					}, label: {
//						Text(cTA)
//							.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//							.padding(.horizontal, 10)
//							.padding(.vertical, 5)
//							.background(
//								RoundedRectangle(cornerRadius: 10)
//									.fill(Color(.systemBlue))
//							)
//							.foregroundColor(.white)
//					})
//				}
//			}
//			.padding([.horizontal, .bottom])
//			
//		}.frame(maxWidth: 375)
//			.background(
//				RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//					.fill((Color.white))
//					.shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.76)), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0)
//			)
//			.padding()
//	}
//}
