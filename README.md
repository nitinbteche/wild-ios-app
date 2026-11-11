# Wild — iOS Wildlife & Field Exploration App 🌿🐾

**Wild** is a native iOS application built with **SwiftUI** and **Clean MVVM Architecture**, designed for wildlife enthusiasts, field naturalists, and outdoor explorers. Document species encounters, explore high-definition wildlife field guides, track sightings on interactive habitat radars, experience biophony soundscapes, and test AI field identification.

---

## ✨ Key Features

### 1. 🌟 Explore Hub & Spotlight
* **Daily Featured Species**: Dynamic spotlight highlighting global wildlife, taxonomy, IUCN Red List status, and behavioral facts.
* **Seasonal Migration Radar**: Real-time alerts on active avian and insect migration corridors (e.g. Monarch butterfly autumn flyway).
* **Biome Discovery Carousel**: Explore major planetary biomes (Tropical Rainforest, Alpine Tundra, Pelagic Oceans, Savannas) and their keystone species.
* **Quick Metrics**: Instant dashboard tracking total encounters, distinct species logged, and earned ranger badges.

### 2. 📖 Comprehensive Field Guide & Encyclopedia
* **Curated Species Database**: In-depth profiles covering mammals, birds, reptiles, amphibians, marine life, and insects.
* **IUCN Red List Statuses**: Color-coded badges for *Critically Endangered (CR)*, *Endangered (EN)*, *Vulnerable (VU)*, *Near Threatened (NT)*, and *Least Concern (LC)*.
* **Taxonomic Hierarchy**: Complete scientific classification (Kingdom $\to$ Phylum $\to$ Class $\to$ Order $\to$ Family $\to$ Genus).
* **Key Characteristics**: Matrix of diet, lifespan, weight, size, natural habitats, threats, and fun facts.
* **Vocal Call Simulation**: Audio visualizer depicting species vocalizations (e.g., Tiger roar, Snow leopard chuff, Whale song).
* **Multi-Filter & Instant Search**: Filter by taxonomic group, conservation urgency, or saved bookmarks.

### 3. 🗺️ Wildlife Radar & Global Sightings Map
* **MapKit Integration**: Interactive coordinate mapping of field encounters with custom category annotations.
* **Biome & Category Filters**: Filter markers by Mammals 🐾, Birds 🦅, Reptiles 🦎, Marine Life 🐋, Amphibians 🐸, and Insects 🦋.
* **Waypoint Inspect**: Tap any map pin to inspect observation timestamp, location name, and jump directly into the field log.

### 4. 📓 Field Journal & Encounter Logger
* **Field Observation Logging**: Log new sightings with date/time, count, location names, and GPS coordinate tagging.
* **Environmental Context**: Log weather conditions (Sunny, Fog, Rain, Snow) and observation confidence level (Confirmed, Probable, Possible).
* **Tags & Field Notes**: Support for custom hashtags (e.g. `#BreedingPair`, `#ApexPredator`, `#LakeView`).
* **Local Persistence**: Sightings and bookmarks automatically persist across app launches.

### 5. 🎧 Wild Biome Soundscapes (Acoustic Ecology)
* **High-Definition Nature Audio**: Immersive acoustic environments including Amazon Canopy Chorus, Himalayan Ridge Wind, Serengeti Dusk Symphony, and Deep Pelagic Drift.
* **Interactive Player**: Background audio mode, live waveform visualizer, progress scrub, and volume controls.

### 6. 🔍 Field AI Species Recognition (Scanner Simulation)
* **Morphological Scanner**: Camera reticle viewfinder with scanning radar animation.
* **Confidence Scoring**: Simulates on-device Vision/CoreML classification with probability matches and 1-tap logging.

### 7. 🏅 Ranger Badges & Field Milestones
* **Accolades Engine**: Automatically tracks milestones (*First Step into the Wild*, *Avian Enthusiast*, *Apex Observer*, *Ocean Sentinel*, *Master Ranger*).
* **Ranger Profile**: Field title, unit preferences (Metric vs Imperial), and offline cache settings.

---

## 🏗️ Architecture & Directory Structure

```
wild-ios-app/
├── Wild.xcodeproj/                  # Standard Xcode Project configuration
├── Package.swift                     # Swift Package Manager manifest (iOS 17+, macOS 14+)
├── README.md
└── Wild/
    ├── App/
    │   ├── WildApp.swift             # Main SwiftUI application entry point
    │   └── ContentView.swift         # Root environment injection container
    ├── Models/
    │   ├── Species.swift             # Species, Taxonomy, IUCN status & Categories
    │   ├── Sighting.swift            # Observation logs, Weather & Confidence models
    │   ├── Habitat.swift             # Planetary biomes & ecological coverage
    │   ├── Achievement.swift         # Ranger milestones & progress tracking
    │   └── Soundscape.swift          # Acoustic ecology audio tracks
    ├── ViewModels/
    │   ├── ExploreViewModel.swift    # Spotlight rotation & biome data binding
    │   ├── FieldGuideViewModel.swift # Search, filtering & bookmarking engine
    │   ├── MapViewModel.swift        # MapKit coordinates & viewport control
    │   ├── JournalViewModel.swift    # Sighting CRUD & search indexing
    │   └── ProfileViewModel.swift    # User stats, rank & settings preferences
    ├── Views/
    │   ├── Navigation/
    │   │   └── MainTabView.swift     # 6-tab primary navigation controller
    │   ├── Explore/
    │   │   ├── ExploreView.swift     # Home dashboard & daily discovery
    │   │   ├── SpeciesSpotlightCard.swift
    │   │   └── HabitatCard.swift
    │   ├── Guide/
    │   │   ├── FieldGuideView.swift  # Searchable species catalog
    │   │   ├── SpeciesDetailView.swift
    │   │   └── SpeciesFilterSheet.swift
    │   ├── Map/
    │   │   ├── WildlifeMapView.swift # MapKit radar with custom callouts
    │   │   └── SightingAnnotationCard.swift
    │   ├── Journal/
    │   │   ├── JournalView.swift     # Sightings timeline
    │   │   ├── NewSightingSheet.swift # Form to log observations
    │   │   └── SightingDetailView.swift
    │   ├── Soundscapes/
    │   │   └── SoundscapesView.swift # Biome acoustic player & visualizer
    │   ├── Identifier/
    │   │   └── FieldIdentifierView.swift # AI camera scanner simulation
    │   ├── Profile/
    │   │   ├── ProfileView.swift     # Ranger stats & system settings
    │   │   └── AchievementsView.swift
    │   └── Components/
    │       ├── StatusBadge.swift     # IUCN conservation pill tag
    │       ├── StatCounterCard.swift # Metric counter card
    │       ├── HabitatTag.swift      # Category pill chip
    │       └── AudioVisualizerView.swift # Dynamic animated audio bars
    ├── Services/
    │   ├── DataStore.swift           # Centralized reactive state & persistence
    │   ├── MockDataLoader.swift      # Comprehensive seed catalog
    │   └── AudioPlayerService.swift  # Nature ambiance audio engine
    ├── Theme/
    │   └── WildTheme.swift           # Palette: Forest Greens, Amber & Earth tones
    └── Resources/
        ├── Info.plist                # Privacy permissions (Location, Camera, Audio)
        └── Assets.xcassets/          # App icon & Accent color catalog
```

---

## 🚀 Getting Started

### Requirements
* **iOS 17.0+**
* **Xcode 15.0+** or **Xcode 16.0+**
* **Swift 5.9+** or **Swift 6.0+**

### Opening in Xcode
1. Clone the repository:
   ```bash
   git clone https://github.com/nitinbteche/wild-ios-app.git
   cd wild-ios-app
   ```
2. Open `Wild.xcodeproj` in Xcode:
   ```bash
   open Wild.xcodeproj
   ```
   *(Alternatively, open the folder directly as a Swift Package in Xcode).*
3. Select an iOS Simulator (e.g., iPhone 15 Pro, iPhone 16 Pro) and hit **Run (⌘ + R)**.

---

## 🎨 Design System

* **Forest Palette**: Deep Evergreen (`#1E3F20`), Emerald (`#0E2818`), Leaf Green (`#5C996B`), Moss (`#4A7C59`).
* **Accents**: Earth Amber (`#E08D3C`), Terracotta (`#C85A32`), River Blue (`#2B6CB0`).
* **Adaptive Materials**: Native SwiftUI `.ultraThinMaterial` and semantic system colors supporting both Dark Mode and Light Mode seamlessly.

---

## 📜 License
MIT License. Built for nature explorers and wildlife advocates worldwide.
