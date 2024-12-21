//
//  CircleImageView.swift
//  Simart UMBY
//
//  Created by фкшуа on 06/11/24.
//

import SwiftUI

struct CircleImageView: View {
    var size: CGSize?
    var image: Image
    
    var body: some View {
        image.frame(width: size?.width ?? 150, height: size?.height ?? 150).clipShape(Circle()).overlay(Circle().stroke(.white, lineWidth: 4)).shadow(radius: 7)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(size: CGSize(width: 200, height: 200), image: Image("icybay"))
    }
}
