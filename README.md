# Yummo

## Description
Yummo is a mobile application designed to help users manage their recipes and shopping lists seamlessly.

## Core Features
- **Recipe Management:** Easily add, view, and delete your favorite recipes.
- **Shopping List:** Create and manage a shopping list based on your planned meals.

## Technologies Used
- SwiftUI
- CoreData

## How to Run
Yummo is an Xcode project. To run the application:
1. Clone or download the repository.
2. Open the `Yummo.xcodeproj` file in Xcode.
3. Select a simulator or connect a device.
4. Click the "Run" button (or Product > Run).

## Project Structure
- `Yummo/Components/`: Contains reusable SwiftUI view components used across the app.
- `Yummo/Model/`: Includes data models for the application (e.g., `Recipe.swift`, `ShoppingItems.swift`).
- `Yummo/Recipe/`: Contains views and view models related to recipe management.
- `Yummo/ShoppingList/`: Contains views and view models for the shopping list feature.
- `Yummo/Assets.xcassets/`: Stores images, icons, and other assets.
- `Yummo/RecipeDataModel.xcdatamodeld/`: Defines the CoreData schema.

## Future Improvements
- User authentication to allow users to save their data in the cloud.
- Sharing recipes with other users.
- Adding nutritional information to recipes.
- Importing recipes from websites.
- An Apple Watch companion app.
