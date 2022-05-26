//
//  NewCategoriesCard.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct NewCategoriesCard: View {
	
	//let wallpaper: NewCategoriesM
	//@ObservedObject var imageLoader = ImageLoader()
	
	let title: String
	let imageStr: String
	
	var body: some View {
		VStack(alignment: .center) {
			ZStack {
				Rectangle()
					.fill(Color.cGray29)
				
				AsyncImageView(imageStr: imageStr)
			}
			.frame(width: 100, height: 100)
			.aspectRatio(1/1, contentMode: .fit)
			.cornerRadius(4)
			
			Text(title)
				.nunitoFont()
				.foregroundColor(.black) // ??
		}
		.lineLimit(1)
		.onAppear {
			//self.imageLoader.loadImage(with: ...)
		}
	}
}

struct NewCategoriesCard_Previews: PreviewProvider {
    static var previews: some View {
			NewCategoriesCard(title: "Art", imageStr: "art")
    }
}
