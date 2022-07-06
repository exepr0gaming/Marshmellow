//
//  CustomNavBarContainerView.swift
//  CustomNavBar
//
//  Created by Курдин Андрей on 28.06.2022.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
	
	let content: Content
	@State private var title: String? = nil
	@State private var subtitle: String? = nil
	@State private var showBackButton: Bool = false
	@State private var isDetail: Bool = false
	@State private var isMain: Bool = true
	@State private var isCongratulations: Bool = false
	
	init(@ViewBuilder content: () -> Content) {
		self.content = content()
	}
	
	var body: some View {
		VStack(spacing: 0) {
		if isDetail {
			ZStack(alignment: .top) {
				contentView
				CustomNavBarView(isDetail: isDetail, showBackButton: showBackButton, title: title, subtitle: subtitle, isMain: isMain, isCongratulations: isCongratulations)
					.offset(y: 30)
			} //ZStack
		} else {
			CustomNavBarView(isDetail: isDetail, showBackButton: showBackButton, title: title, subtitle: subtitle, isMain: isMain, isCongratulations: isCongratulations)
				contentView
			} //else
		} //VStack
		
		
//		if isDetail {
//			ZStack(alignment: .top) {
//				contentView
//				CustomNavBarView(isDetail: isDetail, showBackButton: showBackButton, title: title, subtitle: subtitle, isMain: isMain)
//			} //ZStack
//		} else {
//			VStack(spacing: 0) {
//				CustomNavBarView(isDetail: isDetail, showBackButton: showBackButton, title: title, subtitle: subtitle, isMain: isMain)
//				contentView
//			} //VStack
//		} //else
//
	}
}

extension CustomNavBarContainerView {
	private var contentView: some View {
		content.frame(maxWidth: .infinity, maxHeight: .infinity)
			.onPreferenceChange(NavBarTitlePKey.self) { self.title = $0 }
			.onPreferenceChange(NavBarSubtitlePKey.self) { self.subtitle = $0 }
			.onPreferenceChange(NavBarBackButtonHiddenPKey.self) { self.showBackButton = !$0 }
			.onPreferenceChange(NavBarIsDetailPKey.self) { self.isDetail = $0 }
			.onPreferenceChange(NavBarIsMainPKey.self) { self.isMain = $0 }
			.onPreferenceChange(NavBarIsCongratulationsPKey.self) { self.isCongratulations = $0 }
	}
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
	static var previews: some View {
		CustomNavBarContainerView {
			ZStack {
				Color.green.ignoresSafeArea()
				Text("Hello boy!").foregroundColor(.white)
					.navBarTitle("New title")
					.navBarSubtitle("Subtitle")
					.navBarBackButtonHidden(true)
			}
		}
	}
}
