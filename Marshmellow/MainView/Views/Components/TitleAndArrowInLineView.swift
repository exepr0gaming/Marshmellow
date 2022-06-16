//
//  TitleAndArrowInLineView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 23.05.2022.
//

import SwiftUI

struct TitleAndArrowInLineView: View {
	
	var title: String
	var fontSize: CGFloat = 17
	var arrowColor: Color = .cGreen
	var isShadow: Bool = true
	
    var body: some View {
			
			HStack(alignment: .center) {
				Text(title)
					.nunitoFont(name: FontsE.nunitoBold.rawValue, size: fontSize)
					.padding(.horizontal)
				
				Spacer()
				
				if isShadow {
					Image(systemName: "arrow.right")
						.font(.system(size: 20))
						.foregroundColor(arrowColor)
						.shadow(color: Color.cGreen, radius: 5, x: 0, y: 0)
				} else {
					Image(systemName: "arrow.right")
						.font(.system(size: 20))
						.foregroundColor(arrowColor)
				}
			}
			.padding(.trailing, 4) // need 22 (-4 + 18 from all)
			
			
    }
}

struct TitleAndArrowInLineView_Previews: PreviewProvider {
    static var previews: some View {
			TitleAndArrowInLineView(title: "Install").environmentObject(WallpapersFetcher())
    }
}
