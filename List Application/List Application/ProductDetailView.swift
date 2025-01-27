import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @Binding var cart: [Product] // Reference to the cart array

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Product Image
                AsyncImage(url: URL(string: product.image)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)

                // Product Title
                Text(product.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Product Price
                Text("Price: $\(product.price, specifier: "%.2f")")
                    .font(.title2)
                    .foregroundColor(.green)

                // Product Description
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)

                // "Add to Cart" Button
                Button(action: {
                    addToCart()
                }) {
                    Text("Add to Cart")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)

                // "View Cart" Button
                NavigationLink(destination: CartView(cart: $cart)) {
                    Text("View Cart (\(cart.count))")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Product Details")
    }

    private func addToCart() {
        if !cart.contains(where: { $0.id == product.id }) {
            cart.append(product)
            print("Added to Cart: \(product.title)")
        } else {
            print("\(product.title) is already in the cart.")
        }
    }
}
