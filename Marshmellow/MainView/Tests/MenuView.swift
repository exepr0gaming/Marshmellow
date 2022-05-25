//
//  MenuView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 22.05.2022.
//

import SwiftUI

struct MenuView: View {
	
	@State var currentType: String = "Marshmello"
	// MARK: - For Smooth Sliding Effect
	@Namespace var animation // readAboutIt
	//@State var workouts: [WorkoutModel] = workoutsData
	@State var headerOffsets: (CGFloat, CGFloat) = (0, 0)
	
	var body: some View {
		
		VStack {
			ScrollView(.horizontal, showsIndicators: false) {
				PinnedHeaderListView()
					.background(Color.black)
					.offset(y: headerOffsets.1 > 0 ? 0 : -headerOffsets.1 / 12)
					.modifier(OffsetModifier(offset: $headerOffsets.0, returnFromStart: false))
					.modifier(OffsetModifier(offset: $headerOffsets.1))
			}
			.background(Color.black)
			.coordinateSpace(name: "Scroll") // WTF Scroll
			.ignoresSafeArea(.container, edges: .vertical) // readAboutIt
			
			Text("\(headerOffsets.0)")
			Text("\(headerOffsets.1)")
		}
		
//		ScrollView(.vertical, showsIndicators: false) {
//			VStack(spacing: 0) {
//				//HeaderView()
//
//				// MARK: - Pinned Header with Content
//				LazyVStack(pinnedViews: [.sectionHeaders]) {
//					Section {
//						//WorkoutList()
//					} header: {
//						PinnedHeaderListView()
//							.background(Color.black)
//							.offset(y: headerOffsets.1 > 0 ? 0 : -headerOffsets.1 / 8)
//							.modifier(OffsetModifier(offset: $headerOffsets.0, returnFromStart: false))
//							.modifier(OffsetModifier(offset: $headerOffsets.1))
//					}
//
//				}
//			}
//		}
//		.background(Color.black)
//		.coordinateSpace(name: "Scroll") // WTF Scroll
//		.ignoresSafeArea(.container, edges: .vertical) // readAboutIt
	}
	
	
	
	// MARK: - GetIndex Workout
//	private func getIndex(workout: WorkoutModel) -> Int {
//		return workouts.firstIndex { currentWorkout in
//			return workout.id == currentWorkout.id
//		} ?? 0
//	}
	

	
	// MARK: - Pinned Header List
	@ViewBuilder
	func PinnedHeaderListView() -> some View {
		
		let types: [String] = ["Marshmello", "Animals", "Anime", "Art", "Marshmello1", "Animals1", "Anime1", "Art1", "Marshmello2", "Animals2", "Anime2", "Art2"]
		
		ScrollView(.horizontal, showsIndicators: false) {
			
			HStack(spacing: 25) {
				ForEach(types, id: \.self) { type in
					VStack(spacing: 12) {
						Text(type)
							.fontWeight(.semibold)
							.foregroundColor(currentType == type ? .white : .gray)
						
						ZStack{
							if currentType == type {
								RoundedRectangle(cornerRadius: 4, style: .continuous)
									.fill(.white)
									.matchedGeometryEffect(id: "TAB", in: animation)
							} else {
								RoundedRectangle(cornerRadius: 4, style: .continuous)
									.fill(.clear)
							}
						} // ZStack
						.padding(.horizontal, 8)
						.frame(height: 4)
					}
					.contentShape(Rectangle())
					.onTapGesture {
						withAnimation(.easeInOut) {
							currentType = type
						}
					}
				} // ForEach
				
			} // HStack
			.padding(.horizontal)
			.padding(.top, 25)
			.padding(.bottom, 5)
		}
	}
	
	
}

struct OffsetModifier: ViewModifier {
	@Binding var offset: CGFloat
	// Optional to return value from 0
	var returnFromStart: Bool = true
	@State var startValue: CGFloat = 0
	
	func body(content: Content) -> some View {
		content
			.overlay {
				GeometryReader { proxy in
					Color.clear
						.preference(key: OffsetKey.self, value: proxy.frame(in: .named("Scroll")).minY)
						.onPreferenceChange(OffsetKey.self) { value in
							if startValue == 0 { startValue = value }
							offset = (value - (returnFromStart ? startValue : 0))
						}
				}
			}
	}
}

// MARK: - Preference Key
struct OffsetKey: PreferenceKey {
	static var defaultValue: CGFloat = 0
	
	static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
		value = nextValue()
	}
}

struct MenuView_Previews: PreviewProvider {
		static var previews: some View {
				MenuView()
		}
}
