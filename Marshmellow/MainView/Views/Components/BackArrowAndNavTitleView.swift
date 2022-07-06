//
//  BackArrowAndNavTitleView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.06.2022.
//

import SwiftUI

struct BackArrowAndNavTitleView: View {
	
	var title: String
	var size: Double = 20
	//@ObservedObject var tabData: TabDataModel
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@Binding var tabSelection: TabE
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//	var btnBut: some View { Button { self.presentationMode.wrappedValue.dismiss()
//		} label: {Text("go back bro")}}
	
    var body: some View {
			VStack(spacing: 7) {
				HStack(alignment: .center) {
					Button {
						if wallpapersFetcher.isOpenDetail {
							self.presentationMode.wrappedValue.dismiss()
						} else {
							tabSelection = .live
						}
					
						print("wtf dude press self.presentationMode.wrappedValue.dismiss()")
					} label: {
						Image(systemName: "arrow.left")
							.font(.system(size: 20))
							.foregroundColor(.white)
					}
					
					Spacer()
					
					Text(title)
						.nunitoFont(name: FontsE.balooBhaijaan.rawValue, size: size)
						.padding(.horizontal)
					
					Spacer()
				}
				.padding(.horizontal, 21)
				
				Color.cGray49.frame(height: wallpapersFetcher.isOpenDetail ? 0 : 1)
			}
			.frame(height: 44).zIndex(5)
    }
}

//struct BackArrowAndNavTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//			BackArrowAndNavTitleView(title: "Live Wallpapers", tabData: TabDataModel())
//    }
//}
