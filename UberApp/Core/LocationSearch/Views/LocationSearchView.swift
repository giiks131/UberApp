//
//  LocationSearchView.swift
//  UberApp
//
//  Created by Aleksandr Shapovalov on 20/12/22.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            // header
            
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
//                        .background(Color(.systemGroupedBackground))
                        .padding([.trailing, .leading], 5)
                        .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.secondary.opacity(0.5))
//                            .background(Color(.systemGroupedBackground))
                        )
                        .background(Color(.systemGroupedBackground))
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
//                        .background(Color(.systemGray4))
                        .padding([.trailing, .leading], 5)
                        .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.secondary.opacity(0.5))
//                            .background(Color(.systemGroupedBackground))
                        )
                        .background(Color(.systemGray4))
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            // list
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        
                        LocationSearchResultsCell(title: result.title, subTitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    viewModel.selectLocation(result)
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
        }
        .background(.white)
    }
}

//struct LocationSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationSearchView(mapState: .constant(.searchingForLocation))
//    }
//}
