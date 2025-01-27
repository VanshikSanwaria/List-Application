//
//  ProductViewModel.swift
//  List Application
//
//  Created by Home Mac on 25/01/25.
//


import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []  // Stores the fetched products
    @Published var categories: [Category] = []  // Stores the fetched categories
    @Published var isLoading = false  // For showing a loading spinner
    @Published var errorMessage: String? = nil  // For error handling

    private var cancellables = Set<AnyCancellable>()  // For managing Combine subscriptions

    // Fetch all products
    func fetchProducts() {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { products in
                self.products = products
            })
            .store(in: &self.cancellables)
    }

    // Fetch product categories
    func fetchCategories() {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "https://fakestoreapi.com/products/categories") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Category].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { categories in
                self.categories = categories
            })
            .store(in: &self.cancellables)
    }
}