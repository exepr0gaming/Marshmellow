//
//  PopularCategoriesCardV.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct PopularAndLiveCardV: View {
	
	var imageStr: String
	//var wallpaperCat: CategoryModel
	
    var body: some View {
			
				AsyncImageView(imageStr: imageStr)
					.frame(width: 352, height: 176)
					.cornerRadius(6)
			
    }
}

//struct PopularCategoriesCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PopularCategoriesCardV().environmentObject(WallpapersFetcher())
//    }
//}
