//
//  CustomNavBarView.swift
//  CustomNavBar
//
//  Created by Курдин Андрей on 28.06.2022.
//

import SwiftUI

struct CustomNavBarView: View {
	
	@Environment(\.dismiss) var dismiss
	let isDetail: Bool
	let showBackButton: Bool
	let title: String?
	let subtitle: String?
	let isMain: Bool
	let isCongratulations: Bool
	
	var body: some View {
		VStack {
//			if isMain { EmptyView().frame(height: 0) //mainViewBar
//			} else { secondViewBar }
			if !isMain { secondViewBar }
		}
		.padding(isMain ? .horizontal : .all)
		.tint(.white)
		.foregroundColor(.white)
		.font(.headline)
		.background(Color.black.opacity(isDetail ? 0 : 1).ignoresSafeArea(edges: .top) )
		//.background(Color.green)
}}

extension CustomNavBarView {
	
	private var mainViewBar: some View {
		VStack(spacing: 12) {
			HStack(spacing: 16) {
				Spacer()
				
				Text("Marshmello".uppercased())
					.nunitoFont(name: FontsE.balooBhaijaan.rawValue.uppercased(), size: 18)
					.shadow(color: .cGreen, radius: 5, x: 0, y: 0)
				
				Image("ConnectingDataBaseLogo")
					.resizable()
					.frame(width: 34, height: 37)
				
				Text("Wallpapers".uppercased())
					.nunitoFont(name: FontsE.balooBhaijaan.rawValue.uppercased(), size: 18)
					.shadow(color: .cGreen, radius: 5, x: 0, y: 0)
				
				Spacer()
			}
			Color.cGray49.frame(height: 1)
		}
	}
	
	private var secondViewBar: some View {
		HStack {
			if showBackButton { backButton }
			
			Spacer()
			titleSection
			Spacer()
			
			if showBackButton { backButton.opacity(0) }
		}
	}
	
	private var backButton: some View {
		Button {
			dismiss()
			//presentationMode.wrappedValue.dismiss()
		} label: {
			Image(systemName: !isCongratulations ? "arrow.left" : "xmark")
				.foregroundColor(.white)
				.font(.system(size: 20))
		}
	}
	private var titleSection: some View {
		VStack(spacing: 4) {
			Text(title ?? "").nunitoFont(name: FontsE.balooBhaijaan.rawValue.uppercased(), size: 18)
			if let subtitle = subtitle { Text(subtitle) }
		}
	}
}


struct CustomNavBarView_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			CustomNavBarView(isDetail: false, showBackButton: true, title: "title here", subtitle: "subtitle here", isMain: false, isCongratulations: false)
			Spacer()
		}
	}
}
