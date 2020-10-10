//
//  UpdateDetail.swift
//  DesignCode Tutorial
//
//  Created by Tad Scritchfield on 9/15/20.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[1]
    
    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(DefaultListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
