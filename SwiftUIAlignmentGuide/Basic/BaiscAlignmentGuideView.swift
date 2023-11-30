//
//  BaiscAlignmentGuideView.swift
//  SwiftUIAlignmentGuide
//
//  Created by Gab on 2023/11/30.
//

import SwiftUI

struct BaiscAlignmentGuideView: View {
    @State private var position = 0
    
    var body: some View {
        
        VStack {

            Spacer()

            ZStack {

                Text("심상갑")
                    .padding(.all, 10)
                    .background(.blue)
                    .opacity(0.5)
                    .cornerRadius(10)
                    .alignmentGuide(HorizontalAlignment.center) { d in
                        self.gabHorPosition(d: d)
                    }
                    .alignmentGuide(VerticalAlignment.center) { d in
                        self.gabVerPosition(d: d)
                    }

                Text("카파")
                    .padding(.all, 10)
                    .background(.yellow)
                    .opacity(0.5)
                    .cornerRadius(10)
                    .alignmentGuide(HorizontalAlignment.center) { d in
                        self.kappaHorPosition(d: d)
                    }
                    .alignmentGuide(VerticalAlignment.center) { d in
                        self.kappaVerPosition(d: d)
                    }
            }

            Spacer()

            HStack(spacing: 15) {
                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        self.position = 1
                    }
                } label: {
                    
                    Text("심상갑 카파")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                }

                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        self.position = 2
                    }
                } label: {
                    
                    
                    Text("카파 심상갑")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                }

                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        self.position = 3
                    }
                } label: {
                    
                    Text("심상갑 \n카파")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                    
                }


                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        self.position = 4
                    }
                } label: {
                    
                    Text("카파 \n심상갑")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                    
                }

                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        self.position = 0
                    }
                } label: {
                    
                    Text("리셋")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)

                }

            }
        }
    }
    
    func gabHorPosition(d: ViewDimensions) -> CGFloat {
        
        switch position {
        case 1:
            return d[.trailing] + 10
        case 2:
            return d[.leading] - 10
        default:
            return d[HorizontalAlignment.center]
        }
        
    }
    
    func gabVerPosition(d: ViewDimensions) -> CGFloat {
        
        switch position {
        case 3:
            return d[.bottom] + 10
        case 4:
            return d[.top] - 10
        default:
            return d[VerticalAlignment.center]
        }

    }
    
    func kappaHorPosition(d: ViewDimensions) -> CGFloat {
        
        switch position {
        case 1:
            return d[.leading] - 10
        case 2:
            return d[.trailing] + 10
        default:
            return d[HorizontalAlignment.center]
        }
        
    }
    
    func kappaVerPosition(d: ViewDimensions) -> CGFloat {
        
        switch position {
        case 3:
            return d[.top] - 10
        case 4:
            return d[.bottom] + 10
        default:
            return d[VerticalAlignment.center]
        }
        
    }
}

struct BaiscAlignmentGuideView_Previews: PreviewProvider {
    static var previews: some View {
        BaiscAlignmentGuideView()
    }
}
