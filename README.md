# MyMap App

MyMap is an iOS application developed in Objective-C that provides geolocation services. The app allows users to explore maps, view their current location, and add custom annotations. This README.md file provides an overview of the project structure, features, code highlights, and potential future development directions.

## Features

- **User Location**: Displays the user's current location on the map.
- **Custom Annotations**: Allows users to add custom markers with specified latitude and longitude.
- **Automatic Map Update**: Dynamically updates the map to follow the user's location.

## Project Structure

### `MainViewController.m`

- Manages the core functionality of the application.
- Handles user location updates and annotation addition to the map.

### `ViewController.m`

- Implements additional features for user input handling and map annotation management.
- Utilizes CLLocationManager for obtaining and updating the user's location.

## Getting Started

Follow these steps to use MyMap:

1. **Clone Repository**: Clone the repository to your local machine.
2. **Open Xcode Project**: Navigate to the "MyMap" directory and open the Xcode project.
3. **Build and Run**: Build and run the project on your iOS device or simulator.

## Usage

### Map View

- The app opens to a map view displaying the user's current location.
- The map automatically updates to follow the user's movements.

### Add Custom Annotation

1. **Enter Coordinates**: Input desired latitude and longitude values in the respective text fields.
2. **Add Annotation**: Tap the "Add Annotation" button to place a custom marker on the map.
3. **Zoom In**: The map zooms in on the added annotation.

## Code Highlights

### `MainViewController.m`

```objective-c
// Handles user location updates
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation { 
    // Code for updating location...
}

// Adds custom annotation to the map
- (IBAction)annotationAction:(id)sender { 
    // Code for adding annotation...
}
```

### `ViewController.m`

```objective-c
// Handles user input for custom annotation
- (IBAction)annotationAction:(id)sender { 
    // Code for handling user input...
}

// Updates map to follow user's location
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation { 
    // Code for updating map...
}
```

## Future Development

### Navigation Functionality

- **Turn-by-Turn Navigation**: Implement turn-by-turn navigation for users.
- **Route Optimization**: Optimize routes based on real-time traffic data.
- **Voice Guidance**: Provide voice-guided navigation instructions.

### Additional Features

- **Search Functionality**: Allow users to search for locations or points of interest.
- **Offline Maps**: Implement offline map support for users without a constant internet connection.
- **User Profiles**: Introduce user profiles with the ability to save favorite locations and routes.

## Dependencies

- MyMap relies on the MapKit framework for map-related functionalities.

## Contributions

Contributions are encouraged! If you encounter any issues or have improvement suggestions, open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.