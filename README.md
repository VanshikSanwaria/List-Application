The List Application is an iOS app built with SwiftUI that fetches data from the Fake Store API. Users can browse products, toggle between categories, view product details, and manage a cart. Features include a shimmer loader for smooth loading, search functionality, and a clean, modern UI.

# List Application

## Overview
This is a SwiftUI-based list application built for the iOS internship assignment with Vijayi Technologies. It fetches data from the **Fake Store API** to display:
1. A list of **products**.
2. A list of **categories**.

Users can:
- View product details.
- Add products to a cart.
- View and manage items in the cart.
- Toggle between the product list and category list.

## Features
1. **Dynamic Data**: Fetches products and categories from a public API.
2. **Product Detail View**: Displays detailed information for each product.
3. **Search**: Filter products by title.
4. **Cart Management**: Add, remove, and view items in the cart.
5. **Shimmer Effect**: Displays a shimmer loader while data is loading.

## Screenshots
### Home Screen
![Home Screen](https://drive.google.com/file/d/11u6D0ECjIRjZ8Clm5ExAQxkb8vUzCLeY/view?usp=sharing)

### Product Detail Screen
![Product Detail Screen](https://drive.google.com/file/d/1QZdZnDRok82KseuON2McmIDbwZgoVDpy/view?usp=sharing)

### Categories Screen
[Categories Screen](https://drive.google.com/file/d/1I7MOL0AuqDZwIMPccDxYqipL2-sDZ0nD/view?usp=sharing)

### Cart Screen
![Cart Screen](https://drive.google.com/file/d/1QZdZnDRok82KseuON2McmIDbwZgoVDpy/view?usp=sharing)

### Shimmer Loader
![Shimmer Loader](https://drive.google.com/file/d/1exfz3hdyQiIMqQ_Fkf7tHOk3CaMpyYfb/view?usp=sharing)

## API Documentation
- **Base URL**: `https://fakestoreapi.com`

### Endpoints
1. **Products**: `/products`
   - Fetches all products.
   - Example Response:
     ```json
     [
       {
         "id": 1,
         "title": "Fjallraven Backpack",
         "price": 109.95,
         "description": "Your perfect pack for everyday use...",
         "category": "men's clothing",
         "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
       }
     ]
     ```

2. **Categories**: `/products/categories`
   - Fetches a list of product categories.
   - Example Response:
     ```json
     ["electronics", "jewelery", "men's clothing", "women's clothing"]
     ```

## How to Run the Project
1. Open the project in **Xcode 14+**.
2. Ensure your development environment supports **iOS 16+**.
3. Run the app on a simulator or device.
4. Explore features like searching, viewing products, and managing the cart.

## Known Issues
(List any known issues or limitations here, if any.)

## Future Enhancements
1. Add persistent cart storage using Core Data.
2. Implement a payment or checkout feature.

---
