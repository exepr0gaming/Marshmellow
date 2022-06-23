import SwiftUI

// Custom View Builder
struct PagerTabView<Content: View, Label: View>: View {
	
	var content: Content
	var label: Label
	//var tint: Color
	@Binding var selection: Int
	@Binding var offsetX: CGFloat
	
	init(//tint: Color,
		selection: Binding<Int>, offsetX: Binding<CGFloat>,
		@ViewBuilder labels: @escaping () -> Label,
		@ViewBuilder content: @escaping () -> Content) {
			self.content = content()
			self.label = labels()
			//self.tint = tint
			self._selection = selection
			self._offsetX = offsetX
		}
	
	// Offset for Page Scroll
	//@State var offset: CGFloat = 0
	@State var maxTabs: CGFloat = 0
	@State var tabOffset: CGFloat = 0
	@State var labelScrollWidth: CGFloat = 0
	@State var labelminY: CGFloat = 0
	
	@State private var positionOfScroll: CGFloat = 0
	
	// Offset for Sticky segmented Picker
	//@State var topHeaderOffset: CGFloat = 0
	//	GeometryReader { proxy -> Color in
	//		let minY = proxy.frame(in: .global).minY
	//		DispatchQueue.main.async {
	//			if topHeaderOffset == 0 { topHeaderOffset = minY}
	//		}
	//		return Color.clear
	//	}.frame(width: 0, height: 0)
	var body: some View {
		
		VStack(spacing: 0) {
			
//							ScrollView(.horizontal, showsIndicators: false) {
//
//										HStack {
//											label.offset(x: -tabOffset)
//										}.frame(height: 73)
//											.background(GeometryReader { proxy in Color.clear.onAppear {
//												labelScrollWidth = proxy.size.width
////												labelScrollminYHeight = proxy.frame(in: .global).minY
////												let minY = proxy.frame(in: .global).minY
////												print("\(topHeaderOffset) = \(minY)")
////												labelScrollminYHeight = minY
//											}})
//											// For Tap to change tab
////											.overlay(
////												HStack(spacing: 0) {
////													ForEach(0..<Int(maxTabs), id: \.self) { index in
////														Rectangle()
////															.fill(Color.black.opacity(0.01))
////															.onTapGesture {
////																// Changing offset based on Index
////																let newOffset = CGFloat(index) * getScreenBounds().width
////																self.offset = newOffset
////															}
////													}})
//							}
			
			// MARK: - horizontal scroll not Work
			GeometryReader{ proxy -> AnyView in
				let minY = proxy.frame(in: .global).minY
				DispatchQueue.main.async { labelminY = minY }
				//print("@@@@@ \(minY)")
				return AnyView(
					ScrollView(.horizontal, showsIndicators: false) {
							HStack {
								label.offset(x: -tabOffset)
							}
							.padding(.top, minY > 20 ? 0 : 20)
								.offset(y: minY < 0 ? -minY : 0)

							.background(GeometryReader { proxy in Color.clear.onAppear {
								labelScrollWidth = proxy.size.width
							}})
						}
						
				) // AnyView
			}.frame(height: labelminY > 20 ? 73 : 93)
			
			//				// Indicator
			//				Capsule()
			//					.fill(Color.cGreen)
			//					.shadow(color: Color.cGreen, radius: 8, x: 0, y: 0)
			//					.frame(width: maxTabs == 0 ? 0 : (getScreenBounds().width / maxTabs) - 6, height: 3)
			//					.padding(.top, -8)
			//					.padding(.bottom, 26)
			//					.padding(.leading, 6)
			//					.frame(maxWidth: .infinity, alignment: .leading)
			//					.offset(x: tabOffset)
			
			OffsetPageTabView(maxTabs: $maxTabs, selection: $selection, offset: $offsetX) {
				HStack(spacing: 0) {
					content
				}
				
				// Getting How many tabs are there by getting the total Content Size
				.overlay(
					GeometryReader(content: { proxy in
						Color.clear
							.preference(key: TabPreferenceKey.self, value: proxy.frame(in: .global))
					}))
				
				// When value changes
				.onPreferenceChange(TabPreferenceKey.self) { proxy in
					let minX = -proxy.minX
					let maxWidth = proxy.width //proxy.width
					let screenWidth = getScreenBounds().width
					let maxTabs = (maxWidth / screenWidth).rounded()
					self.maxTabs = maxTabs
					
					//Getting tab offset
					let progress = minX / screenWidth
					
					if maxTabs - progress > 3 {
						self.tabOffset = progress * ( labelScrollWidth / maxTabs)
						self.positionOfScroll = progress * ( labelScrollWidth / maxTabs)
					}
					print("@@@minX=\(-proxy.minX), progress=\(progress), tabOffset=\(tabOffset), maxTabs=\(maxTabs), positionOfScroll=\(positionOfScroll)")
				}
				
			}
		}
		.onAppear {
			self.tabOffset = 0
		}
		
		
	}
}

// Extending Preference
struct TabPreferenceKey: PreferenceKey {
	static var defaultValue: CGRect = .init()
	static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
		value = nextValue()
	}
}

// Extending view for PageLabel and gridViewSettings Modifiers
extension View {
	func gridViewSettings(ignoresSafeArea: Bool = false, edges: Edge.Set = []) -> some View {
		self
			.frame(width: getScreenBounds().width, alignment: .center)
			.ignoresSafeArea(ignoresSafeArea ? .container : .init(), edges: edges)
	}
	
	// Getting screen Bounds
	func getScreenBounds() -> CGRect {
		return UIScreen.main.bounds
	}
}

//struct PagerTabView_Previews: PreviewProvider {
//		static var previews: some View {
//			SecondScreenView(linkToFetchCategory: "")
//		}
//}



