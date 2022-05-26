import SwiftUI

// Custom View Builder
struct PagerTabView<Content: View, Label: View>: View {
	
	var content: Content
	var label: Label
	//var tint: Color
	@Binding var selection: Int
	
	init(//tint: Color,
			 selection: Binding<Int>,
			 @ViewBuilder labels: @escaping () -> Label,
			 @ViewBuilder content: @escaping () -> Content) {
		self.content = content()
		self.label = labels()
		//self.tint = tint
		self._selection = selection
	}
	
	// Offset for Page Scroll
	@State var offset: CGFloat = 0
	@State var maxTabs: CGFloat = 0
	@State var tabOffset: CGFloat = 0
	
		var body: some View {
			
			VStack(spacing: 0) {
				HStack(spacing: 0) {
					label
				}
				// For Tap to change tab
				.overlay(
					HStack(spacing: 0) {
						ForEach(0..<Int(maxTabs), id: \.self) { index in
							Rectangle()
								.fill(Color.black.opacity(0.01))
								.onTapGesture {
									// Changing offset based on Index
									let newOffset = CGFloat(index) * getScreenBounds().width
									self.offset = newOffset
								}
						}
					}
				)
				.padding(.vertical, 10)
				//.foregroundColor(tint)
				
				// Indicator
				Capsule()
					.fill(Color.cGreen)
					.shadow(color: Color.cGreen, radius: 8, x: 0, y: 0)
					.frame(width: maxTabs == 0 ? 0 : (getScreenBounds().width / maxTabs), height: 3)
					.padding(.top, -8)
					.padding(.bottom, 26)
					.frame(maxWidth: .infinity, alignment: .leading)
					.offset(x: tabOffset)
				
				OffsetPageTabView(maxTabs: $maxTabs, selection: $selection, offset: $offset) {
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
						let maxWidth = proxy.width
						let screenWidth = getScreenBounds().width
						let maxTabs = (maxWidth / screenWidth).rounded()
						self.maxTabs = maxTabs
						
						// Getting tab offset
						let progress = minX / screenWidth
						let tabOffset = progress * (screenWidth / maxTabs)
						self.tabOffset = tabOffset
					}
				}
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

// Extending view for PageLabel and PageView Modifiers
extension View {
	func pageLabel() -> some View {
		// just filling all empty space
		self
			.frame(maxWidth: .infinity, alignment: .center)
	}
	
	// Modifications for SafeArena ignoring
	// Same for PageView
	func pageView(ignoresSafeArea: Bool = false, edges: Edge.Set = []) -> some View {
		// just filling all empty space
		self
			.frame(width: getScreenBounds().width, alignment: .center)
			.ignoresSafeArea(ignoresSafeArea ? .container : .init(), edges: edges)
	}
	
	// Getting screen Bounds
	func getScreenBounds() -> CGRect {
		return UIScreen.main.bounds
	}
}

struct PagerTabView_Previews: PreviewProvider {
		static var previews: some View {
			SecondScreenView(wallpaperFetcher: WallpapersFetcher())
		}
}



