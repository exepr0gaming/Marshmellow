//
//  NavigationBarView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 27.05.2022.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        
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
			} // VStack Header
			.padding(.horizontal)
			
			//.frame(width: getScreenBounds().width, height: 100, alignment: .center)
			//.frame(maxWidth: .infinity)
			
    }
}

//struct NavigationBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationBarView()
//				.previewLayout(.sizeThatFits)
//				.padding()
//				.environmentObject(WallpapersFetcher())
//    }
//}
