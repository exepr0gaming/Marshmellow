//
//  SecondScreenView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 23.05.2022.
//

import SwiftUI

struct SecondScreenView: View {
	
	@State var currentSelection: Int = 0
	var catNames: [String] = ["Live", "Animals", "Anime", "Animals"]
	
    var body: some View {
			VStack {
				
				PagerTabView(selection: $currentSelection) { // tint: .black, 
					ForEach(Array(catNames.enumerated()), id: \.offset) { index, name in
						Text(name) // "i=\(index),cS=\(currentSelection), \(name)"
							.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19, color: currentSelection == index ? .white : .cGray49)
							.pageLabel()
					}
					
					//.frame(height: 55)
	//				Image(systemName: "house.fill")
	//					.pageLabel()
					
				} content: {
					
					GridView()
						.pageView(ignoresSafeArea: true, edges: .bottom)
					
					GridView()
						.pageView(ignoresSafeArea: true, edges: .bottom)
					
					GridView()
						.pageView()
					
					GridView()
						.pageView()
				}
				.frame(height: 680) // 55 + 5 + 620
				//.padding(.top)
				//.ignoresSafeArea(.container, edges: .bottom)
				
				// MARK: - Текст и Реклама
				VStack(alignment: .leading, spacing: 14) {
					Text("Lorem ipsum dolor sit amet?")
						.nunitoFont(name: FontsE.nunitoBold.rawValue)

					Text("Pertinax nec, in mei nostrum omittantur. Quo no orem ipsum dolor")
						.nunitoFont()
						.fixedSize(horizontal: false, vertical: true)
						.lineLimit(2)

					Rectangle()
						.fill(Color.cGray29)
						.frame(height: 190)
				}
				.padding(.top, 20)

				VStack(spacing: 9) {
					TitleAndArrowInLineView(title: "Install", arrowColor: .white, isShadow: false)

//					Image(systemName: "circle.dashed")
//						.font(.system(size: 20))
//						.foregroundColor(.white)
					LottieView(name: "loadingWheel", loopMode: .loop)

					GridView()
						.padding(.top, 9)
				}
				
			}
			.background(Color.black)
			
    }
}

struct SecondScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenView()
    }
}
