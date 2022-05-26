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
	
	@ObservedObject var networkService: NetworkService
	
    var body: some View {
        
			VStack(alignment: .leading, spacing: 19) {
				Text(titleView)
					.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19)
					.padding(.horizontal)
				
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(alignment: .top, spacing: 6) {
						ForEach(self.networkService.wallpapers, id: \.self) { wallpaper in
							Text("qewqwe")
//							NewCategoriesCard(title: wallpaper.newCats.nameCategory, imageStr: wallpaper.newCats.urlPhoto)
								//.frame(width: 100, height: 100)
							
//								.padding(.leading, wallpaper.id == self.newCategories.first!.id ? 16 : 0)
//								.padding(.trailing, wallpaper.id == self.newCategories.last!.id ? 16 : 0)
						} // ForEach
					}
				} // ScrollView
				
//				ScrollView(.horizontal, showsIndicators: false) {
//					HStack(alignment: .top, spacing: 6) {
//						ForEach(self.newCategories, id: \.self) { wallpaper in
//							NewCategoriesCard(title: wallpaper.title, imageStr: wallpaper.imageStr)
//								//.frame(width: 100, height: 100)
//								.padding(.leading, wallpaper.id == self.newCategories.first!.id ? 16 : 0)
//								.padding(.trailing, wallpaper.id == self.newCategories.last!.id ? 16 : 0)
//						} // ForEach
//					}
//				} // ScrollView
			}
			.onAppear {
				networkService.fetch()
				print(networkService.wallpapers)
			}
			
    }
}

struct NewCategoriesCarouselView_Previews: PreviewProvider {
    static var previews: some View {
			NewCategoriesCarouselView(titleView: "New Categories", newCategories: newCatData, networkService: NetworkService())
    }
}
