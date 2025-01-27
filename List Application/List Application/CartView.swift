//
//  CartView.swift
//  List Application
//
//  Created by Home Mac on 26/01/25.
//


import SwiftUI

struct CartView: View {
    @Binding var cart: [Product] // Reference to the cart array

    
    var body: some View {
        NavigationView {
            VStack {
                if cart.isEmpty {
                    Text("Your cart is empty!")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(cart) { product in
                            HStack(spacing: 10) {
                                // Product Image
                                AsyncImage(url: URL(string: product.image)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)

                                // Product Details
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(product.title)
                                        .font(.headline)

                                    Text("$\(product.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.green)
                                }

                                Spacer()
                                Text("Total: $\(cart.reduce(0) { $0 + $1.price }, specifier: "%.2f")")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding()
                                // Remove Button
                                Button(action: {
                                    removeFromCart(product: product)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }

                    // "Proceed to Buy" Button
                    Button(action: {
                        proceedToBuy()
                    }) {
                        Text("Proceed to Buy")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
            .navigationTitle("Your Cart")
        }
    }
    private func addToCart(product: Product) {
        if !cart.contains(where: { $0.id == product.id }) {
            cart.append(product)
            print("Added to Cart: \(product.title)")
        } else {
            print("\(product.title) is already in the cart.")
        }
    }
    // Remove an item from the cart
    private func removeFromCart(product: Product) {
        if let index = cart.firstIndex(where: { $0.id == product.id }) {
            cart.remove(at: index)
        }
    }

    // Handle "Proceed to Buy" action
    private func proceedToBuy() {
        print("Proceeding to buy \(cart.count) items!")
        // Add your "Proceed to Buy" logic here (e.g., navigate to a payment screen)
    }
}

