//
//  BottomGridWithInstallView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 28.05.2022.
//

import SwiftUI

struct BottomGridWithInstallView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	
    var body: some View {
        
			VStack(spacing: 9) {
				TitleAndArrowInLineView(title: "Install", arrowColor: .white, isShadow: false)

//					Image(systemName: "circle.dashed")
//						.font(.system(size: 20))
//						.foregroundColor(.white)
				LottieView(name: "progressView", loopMode: .loop)
					.frame(width: 26, height: 26)

//				GridView(detailCategoryM: <#DetailCategoryModel#>) // wallpaperCategory: wallpapersFetcher.linkToFetchCategory
//					.padding(.top, 9)
			}
			
    }
}

struct BottomGridWithInstallView_Previews: PreviewProvider {
    static var previews: some View {
        BottomGridWithInstallView()
    }
}
