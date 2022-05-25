//
//  DetailWallpaperView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 24.05.2022.
//

import SwiftUI

struct DetailWallpaperView: View {
	
	@State private var isPreview: Bool = true
	@StateObject var detailVM = DetailWallpaperVM()
	
	
	
	var body: some View {
		
		ZStack {
			Image("bigR2")
				.resizable()
				.scaledToFill()
				.ignoresSafeArea()
			
			// MARK: - isPreview
			if isPreview {
				
				VStack {
					VStack(spacing: 4) {
						Image(systemName: "lock.fill")
							.font(.system(size: 50))
						
						Text(.now, style: .time)
							.font(.system(size: 83, weight: .light))
						
						Text(detailVM.getCurrentTime())
							.font(.system(size: 83, weight: .light))
						Text(.now, style: .date)
							.font(.system(size: 22, weight: .semibold))
						
						//Text(Date.now.formatted(.dateTime.hour().minute()))
//						Text("\(Calendar.current.component(.hour, from: .now)):\(Calendar.current.component(.minute, from: .now))")
//							.font(.system(size: 83, weight: .light))
						
					}
					.foregroundColor(.white)
					.padding(.top, 59)
					
					Spacer()
					
					HStack(alignment: .bottom, spacing: 26) {
						bottomIcons(image: "flashlight.off.fill")
						Button {
							//isPreview.toggle()
						} label: {
							Text("swipe up to open")
								.font(.system(size: 17))
								.foregroundColor(.white.opacity(0.64))
						}
						bottomIcons(image: "camera.fill")
					}
					.padding(.bottom, 50)
					.gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
										.onEnded({ value in
						if value.translation.height < 0 {
							isPreview.toggle()
						}
					})
					)
					
					
				}
				
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
							detailVM.shareWallpaper("bigR2") // TO-DO image for save
						} label: {
							shareButtonLabel(image: "share")
						}
					} // HStack
					
					YellowButtonLabelView(buttonText: "Save")
						.padding(.bottom, 68)
					
				} // VStack with Buttons
				.padding(.horizontal, 16)
			}
			
		} // ZStack
		//			.mainFrameInfinity()
		//			.ignoresSafeArea(.all)
		
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



struct DetailWallpaperView_Previews: PreviewProvider {
	static var previews: some View {
		DetailWallpaperView()
	}
}
