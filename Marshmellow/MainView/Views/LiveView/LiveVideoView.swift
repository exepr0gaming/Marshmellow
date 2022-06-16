////
////  LiveVideoView.swift
////  Marshmellow
////
////  Created by Курдин Андрей on 07.06.2022.
////
//
//import SwiftUI
//
//
//struct LiveVideoView: View {
//
//	@StateObject var videoManager = VideoManager()
//	@State private var animate: Bool = true
//	var columns = [GridItem(.flexible(minimum: 174, maximum: 400), spacing: 5), GridItem(.flexible(minimum: 174, maximum: 400), spacing: 5)]
//
//    var body: some View {
//			NavigationView {
//				VStack {
//					ScrollView(.horizontal, showsIndicators: false) {
//						HStack {
//							ForEach(1...20, id: \.self) { index in
//								LabelTag(title: "Index=\(index)", isSelected: videoManager.selectedIndexOfCat == index)
//									.onTapGesture {
//										withAnimation(.linear) {
//											videoManager.selectedIndexOfCat = index
//										}
//									}
//
//							}
//						}
//					}
//
//					ScrollView {
//						LazyVGrid(columns: columns) {
//							ForEach(videoManager.categoryUrls, id: \.self) { video in
//								NavigationLink {
//									DetailLiveVideo(videoUrl: video)
//								} label: {
//									VideoCard(videoUrl: video)
//								}
//							}
//						}
//
//					}
//					//.frame(maxWidth: .infinity)
//				}
//				.padding(.horizontal, 11)
//				.background(Color.black)
//				.navigationBarHidden(true)
//				.gesture(
//					DragGesture()
//						.onEnded{ value in
//							if value.translation.width > 10  {
//								if videoManager.selectedIndexOfCat > 0 {
//										videoManager.selectedIndexOfCat -= 1
//								}
//							} else if value.translation.width < -10  {
//								if videoManager.selectedIndexOfCat < 4 {
//										videoManager.selectedIndexOfCat += 1
//								}
//							}
//						}
//				)//.animation(Animation.linear, value: animate)
//				//.animation(.easeIn, value: animate)
//			}
//    }
//}
//
////struct LiveVideoView_Previews: PreviewProvider {
////    static var previews: some View {
////        LiveVideoView()
////    }
////}
