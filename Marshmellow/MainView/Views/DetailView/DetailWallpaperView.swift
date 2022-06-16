//
//  DetailWallpaperView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 24.05.2022.
//

import SwiftUI
import Introspect

struct DetailWallpaperView: View {
	
	@State private var isPreview: Bool = false
	@StateObject var detailVM = DetailWallpaperVM() // ???
	//@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@StateObject var imageLoader: ImageLoader
	@State private var isCongratulations: Bool = false
	@State private var uiTabBarController: UITabBarController?
	@State var detailFor: GridE
	@State var wallpaperURL: String
	
	init(detailFor: GridE, wallpaperURL: String?) {
//		if detailFor == .staticCat {
//			print("detailFor==static")
//			self._imageLoader = StateObject(wrappedValue: ImageLoader(url: wallpaperURL))
//		} else {
//			self._
//		}
		self.detailFor = detailFor
		self._imageLoader = StateObject(wrappedValue: ImageLoader(url: wallpaperURL))
		self.wallpaperURL = wallpaperURL!
	}
	
	var body: some View {
		
		ZStack {
			switch detailFor {
				case .staticCat:
					StaticDetailView(imageLoader: imageLoader)
				case .liveCat:
					LoopingPlayer(url: wallpaperURL, isLocale: false)
						.edgesIgnoringSafeArea(.all)
					//LiveDetailView(videoUrl: wallpaperURL)
			}
			
			
			// MARK: - isPreview
			if isPreview {
				
				VStack {
					VStack(spacing: 4) {
						Image(systemName: "lock.fill")
							.font(.system(size: 50))
						
						Text(.now, style: .time)
							.font(.system(size: 83, weight: .light))
						
						//						Text(detailVM.getCurrentTime())
						//							.font(.system(size: 83, weight: .light))
						Text(.now, style: .date)
							.font(.system(size: 22, weight: .semibold))
					}
					.foregroundColor(.white)
					.padding(.top, 59)
					
					Spacer()
					
					HStack(alignment: .bottom, spacing: 26) {
						
						bottomIcons(image: "flashlight.off.fill")
						
						Button {
							withAnimation {
								isPreview.toggle()
							}
						} label: {
							Text("swipe up to open")
								.font(.system(size: 17))
								.foregroundColor(.white.opacity(0.64))
								.gesture(
									DragGesture().onEnded { value in
											if value.translation.height < 10  { // 10
												withAnimation {
													isPreview.toggle()
												}
											}})
						}
						
						bottomIcons(image: "camera.fill")
					}
					
					.navigationBarHidden(true)
					//.navigationBarBackButtonHidden(true)
					
				}
				
				.padding(.bottom, 67) // 47
				
				// MARK: - Default State (!isPreview)
			} else {
				
				VStack(spacing: 34) {
					
					Spacer()
					
					HStack(spacing: 61) {
						Button {
							isPreview.toggle()
						} label: {
							shareButtonLabel(image: "smartphone")
						}
						
						Button {
							switch detailFor {
								case .staticCat:
									if imageLoader.image != nil {
										detailVM.shareWallpaper(image: imageLoader.image!) // Image(uiImage: imageLoader.image!)
									}
								case .liveCat:
									//
									imageLoader.downloadFile()
							}
						} label: {
							shareButtonLabel(image: "share")
						}
					} // HStack
					
					Button {
						switch detailFor {
							case .staticCat:
								imageLoader.saveImage()
							case .liveCat:
								//
								imageLoader.downloadFile()
						}
						withAnimation {
							self.isCongratulations = true
						}
					} label: {
						YellowButtonLabelView(buttonText: "Save")
					}
					
					
				} // VStack with Buttons
				.padding(.horizontal, 16)
				.padding(.bottom, 88) // 68
				
				.navigationTitle("")
				//.navigationBarBackButtonHidden(true)
			}
			
			if isCongratulations {
				CongratulationsView()
					.navigationBarBackButtonHidden(true)
					.navigationBarHidden(true)
					.frame(maxHeight: getScreenBounds().height)
			}
			
		} // ZStack
		.introspectTabBarController { (UITabBarController) in
			UITabBarController.tabBar.isHidden = true
			uiTabBarController = UITabBarController
		}
		.onDisappear{
			uiTabBarController?.tabBar.isHidden = false
		}
		
		
	}
	
	@ViewBuilder
	private func shareButtonLabel(image: String) -> some View {
		ZStack {
			//Color.black
			
			Circle()
				.fill(Color.black.opacity(0.66))
			
			BlurView(style: .dark)
				.clipShape(Circle())
				.blur(radius: 10)
			
			Image(image)
				.resizable()
				.frame(width: 29, height: 29)
			
		}
		.frame(width: 55, height: 55)
	}
	
	@ViewBuilder
	private func bottomIcons(image: String) -> some View {
		Image(systemName: image)
			.font(.system(size: 25))
			.foregroundColor(.white)
			.padding()
			.background(Circle().fill(Color.gray.opacity(0.5)))
	}
	
}



//struct DetailWallpaperView_Previews: PreviewProvider {
//	static var previews: some View {
//		DetailWallpaperView(wallpaperURL: "http://167.99.51.18/media/wallpapers/live/sky/4434209.mp4").environmentObject(WallpapersFetcher())
//	}
//}
