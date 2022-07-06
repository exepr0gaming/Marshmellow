//
//  DetailWallpaperView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 24.05.2022.
//

import SwiftUI
import Introspect

struct DetailWallpaperView: View {
	//@ObservedObject var adMobService: AdMobService
	@Binding var isInitialPresented: Bool
	
	@State private var isPreview: Bool = false
	@StateObject var detailVM = DetailWallpaperVM() // ???
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@StateObject var imageLoader: ImageLoader
	//@State private var isCongratulations: Bool = false
	@State private var uiTabBarController: UITabBarController?
	@State var detailFor: GridE
	@State var wallpaperURL: String
	
	@Binding var isCongratulations: Bool
	
	
	init(detailFor: GridE, wallpaperURL: String?, isInitialPresented: Binding<Bool>, isCongratulations: Binding<Bool>) {
		self.detailFor = detailFor
		self._imageLoader = StateObject(wrappedValue: ImageLoader(url: wallpaperURL))
		self.wallpaperURL = wallpaperURL!
		self._isInitialPresented = isInitialPresented
		self._isCongratulations = isCongratulations
	}
	
	var body: some View {
		
		ZStack(alignment: .top) {
			//BackArrowAndNavTitleView(title: "2", tabSelection: $wallpapersFetcher.tabE).offset(y: 50)
			
			VStack {
				switch detailFor {
					case .staticCat:
						StaticDetailView(imageLoader: imageLoader)
					case .liveCat:
						LoopingPlayer(url: wallpaperURL, isLocale: false)
							.edgesIgnoringSafeArea(.all)
						//LiveDetailView(videoUrl: wallpaperURL)
				}
			}
				
				// MARK: - isPreview
			VStack {
				if isPreview {
					previewView
				} else {
					saveAndShareView
				}
		}//.frame(height: getScreenBounds().height)
				
				if isCongratulations {
					CongratulationsView()
						//.frame(maxHeight: getScreenBounds().height)
				}
				
			} // ZStack
		.navigationBarHidden(true)
		.navigationBarBackButtonHidden(true)
		
		.introspectTabBarController { (UITabBarController) in
			UITabBarController.tabBar.isHidden = true
			uiTabBarController = UITabBarController
		}
//		.onAppear(perform: {
//			wallpapersFetcher.isOpenDetail = true
//		})
		.onDisappear{
			uiTabBarController?.tabBar.isHidden = false
			isCongratulations = false
			//offsetX = 0
			//wallpapersFetcher.selectedLiveIndex = 0
		}
		
		
		
	}
	
	@ViewBuilder
	private func shareButtonLabel(image: String) -> some View {
		ZStack {
			
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

// MARK: - extension DetailWallpaperView
extension DetailWallpaperView {
	
	private var saveAndShareView: some View {
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
								imageLoader.shareVideoWallpaper()
								//imageLoader.shareWallpaper(image: imageLoader.image!) // Image(uiImage: imageLoader.image!)
							}
						case .liveCat:
							//imageLoader.shareWallpaper(image: imageLoader.image!) // Image(uiImage: imageLoader.image!)
							imageLoader.shareVideoWallpaper()
					}
				} label: {
					shareButtonLabel(image: "share")
				}
			} // HStack
			
			Button {
				switch detailFor {
					case .staticCat:
						print("Detail try save Photo!")
						imageLoader.saveImage()
					case .liveCat:
						print("Detail try save Video!")
						imageLoader.saveVideo()
				}
				withAnimation {
					self.isCongratulations = true
				}
			} label: {
				YellowButtonLabelView(buttonText: "Save")
			}
		} // VStack with Buttons
		.padding(.horizontal, 16)
		.padding(.bottom, 68) // 88
	}
	
	// wallpaper preview screen
	private var previewView: some View {
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
			.padding(.top, 80)
			
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
		}
		.padding(.bottom, 47)
	}
}

