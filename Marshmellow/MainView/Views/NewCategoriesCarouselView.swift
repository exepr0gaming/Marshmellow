//
//  NewCategoriesCarouselView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct NewCategoriesCarouselView: View {
	
	let titleView: String
	let newCategories: [NewCategoriesM]
	
    var body: some View {
        
			VStack(alignment: .leading, spacing: 19) {
				Text(titleView)
					.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19)
					.padding(.horizontal)
				
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(alignment: .top, spacing: 6) {
						ForEach(self.newCategories, id: \.self) { wallpaper in
							NewCategoriesCard(title: wallpaper.title, imageStr: wallpaper.imageStr)
								//.frame(width: 100, height: 100)
								.padding(.leading, wallpaper.id == self.newCategories.first!.id ? 16 : 0)
								.padding(.trailing, wallpaper.id == self.newCategories.last!.id ? 16 : 0)
						} // ForEach
					}
				}
			}
			
    }
}

struct NewCategoriesCarouselView_Previews: PreviewProvider {
    static var previews: some View {
			NewCategoriesCarouselView(titleView: "New Categories", newCategories: newCatData)
    }
}
