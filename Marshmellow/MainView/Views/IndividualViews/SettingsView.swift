//
//  SettingsView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 31.05.2022.
//

import SwiftUI

struct SettingsView: View {
	var body: some View {
		// MARK: - Уменьшил отступы и высоту ячеек, чтобы влазила реклама
		ScrollView(.vertical, showsIndicators: false) {
			VStack {
				Link(destination: URL(string: "https://pro-neft.com/support/")!) {
					rowView(image: "like", text: "Rate us")
				}
				rowView(image: "notepad", text: "Terms & Conditions")
				rowView(image: "shieldCheck", text: "VPN")
				rowView(image: "mail", text: "Email")
				rowView(image: "faceid", text: "Invite")
				Link(destination: URL(string: "https://pro-neft.com/support/")!) {
					rowView(image: "headphone", text: "Support")
				}
			}
			.padding(.top, 20)
			.padding(.horizontal)
				
			AdsAndTextView()
		}
		.mainFrameInfinity()
		.background(Color.black)
	}
	
	@ViewBuilder
	private func rowView(image: String, text: String) -> some View {
		let spacing: CGFloat = 20 // 26
		let height: CGFloat = 50 // 67
		
		HStack(alignment: .center, spacing: spacing) {
			VStack(spacing: spacing) {
				Image(image).resizable().scaledToFill()
					.frame(width: 20, height: 20)
				Color.clear.frame(width: 20, height: 1)
			}.frame(height: height)
			VStack(alignment: .leading, spacing: spacing) {
				Text(text).nunitoFont().frame(height: 20)
				Color.cGray49.frame(height: 1)
			}.frame(height: height)
		}
		
	}
	
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
