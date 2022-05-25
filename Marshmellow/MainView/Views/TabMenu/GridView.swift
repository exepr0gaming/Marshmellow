//
//  GridView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 23.05.2022.
//

import SwiftUI

//let gridList = (1...4).map { }

struct GridView: View {
	
	@State var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
	
    var body: some View {
			LazyVGrid(columns: gridLayout, spacing: 5) {
				ForEach(withMenuCatData, id: \.self) { item in
					Image(item.imageStr)
						.resizable()
						//.scaledToFill()
						//.frame(minWidth: 0, maxWidth: .infinity) // getScreenBounds().width / 4
						.frame(height: 310)
						.cornerRadius(8)
						.padding(.horizontal, -1) // хз почему там spacing больше на 1
				}
			}
			.background(Color.black)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
