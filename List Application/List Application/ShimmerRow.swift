//
//  ShimmerRow.swift
//  List Application
//
//  Created by Home Mac on 26/01/25.
//


import SwiftUI

struct ShimmerRow: View {
    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 50, height: 50)
                .shimmering() // Apply the shimmer effect

            VStack(alignment: .leading, spacing: 5) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 150, height: 15)
                    .shimmering()

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 15)
                    .shimmering()
            }
        }
        .padding(.vertical, 10)
    }
}