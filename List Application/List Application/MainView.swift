import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State private var showProducts = true
    @State private var searchText = "" // State for search input
    @State private var cart: [Product] = [] // Array to store cart items

    // Filtered products based on search text
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return viewModel.products
        } else {
            return viewModel.products.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    // Shimmer Effect for Loading Screen
                    VStack(spacing: 20) {
                        ForEach(0..<5, id: \.self) { _ in
                            ShimmerRow()
                        }
                    }
                    .padding()
                } else {
                    // Picker to toggle between Products and Categories
                    Picker("", selection: $showProducts) {
                        Text("Products").tag(true)
                        Text("Categories").tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    if showProducts {
                        // Products list with search functionality
                        TextField("Search products...", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        List(filteredProducts) { product in
                            HStack {
                                // Product Details Link
                                NavigationLink(destination: ProductDetailView(product: product, cart: $cart)) {
                                    HStack(spacing: 10) {
                                        // Product Image
                                        AsyncImage(url: URL(string: product.image)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            Color.gray
                                        }
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)

                                        // Product Title and Price
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(product.title)
                                                .font(.headline)

                                            Text("$\(product.price, specifier: "%.2f")")
                                                .font(.subheadline)
                                                .foregroundColor(.green)
                                        }
                                    }
                                }

                                Spacer() // Push "Add to Cart" button to the right

                                // Add to Cart Button
                                Button(action: {
                                    addToCart(product: product)
                                }) {
                                    Image(systemName: "cart.badge.plus")
                                        .font(.title2)
                                        .foregroundColor(.blue)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                            .padding(.vertical, 5)
                        }
                    } else {
                        // Categories list
                        List(viewModel.categories, id: \.self) { category in
                            Text(category.capitalized)
                                .font(.headline)
                                .padding(8)
                                .frame(maxWidth: .infinity, alignment: .leading)
    
                        }
                    }

                    // Persistent "View Cart" Button
                    NavigationLink(destination: CartView(cart: $cart)) {
                        HStack {
                            Image(systemName: "cart")
                                .font(.title2)
                                .foregroundColor(.white)

                            Text("View Cart (\(cart.count))")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 10)
                }
            }
            .navigationTitle("Product Explorer")
            .onAppear {
                viewModel.fetchProducts()
                viewModel.fetchCategories()
            }
        }
    }

    // Add product to the cart
    private func addToCart(product: Product) {
        if !cart.contains(where: { $0.id == product.id }) {
            cart.append(product)
            print("Added to Cart: \(product.title)")
        } else {
            print("\(product.title) is already in the cart.")
        }
    }
}
