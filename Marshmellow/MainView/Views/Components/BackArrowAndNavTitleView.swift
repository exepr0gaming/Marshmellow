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
	@Binding var tabSelection: TabE
	
    var body: some View {
			VStack(spacing: 7) {
				HStack(alignment: .center) {
					Button {
					//	tabData.currentTab = .home
						tabSelection = .home
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
				
				Color.cGray49.frame(height: 1)
			}
			.frame(height: 44).zIndex(5)
    }
}

//struct BackArrowAndNavTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//			BackArrowAndNavTitleView(title: "Live Wallpapers", tabData: TabDataModel())
//    }
//}
