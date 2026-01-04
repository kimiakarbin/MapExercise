SwiftUI Map Exploration (iOS 17)
This repository contains a small exploratory iOS 17 project built with SwiftUI and MapKit, focused on common map-based interaction patterns such as pin selection, routing, and area visualization.
The project was developed as a hands-on exercise to explore how these features can be implemented using modern SwiftUI patterns, MVVM, and async/await.

The project includes the following features:

Interactive map with annotations:
  Displays a SwiftUI Map with custom annotations and dynamic markers.
  Shows a fixed starting location (parking) and search-based points of interest.
Pin selection handling:
  Users can tap on map pins to select a location.
Contextual bottom information panel:
  Selecting a pin reveals a bottom panel displaying contextual information about the selected place.
  The panel includes a Look Around preview (when available) and estimated travel time.
Route calculation and rendering:
  Calculates a route from a fixed origin to the selected destination.
  Renders the resulting route dynamically on the map using MapPolyline.
Custom map area visualization:
  Draws a custom polygon overlay representing an approximate city boundary (Turin).
  
