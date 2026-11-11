import Foundation

public struct MockDataLoader {
    public static let sampleSpecies: [Species] = [
        Species(
            commonName: "Bengal Tiger",
            scientificName: "Panthera tigris tigris",
            category: .mammal,
            conservationStatus: .endangered,
            habitat: "Tropical & Subtropical Moist Broadleaf Forests, Mangroves",
            region: "South Asia (India, Bangladesh, Nepal, Bhutan)",
            diet: "Carnivore (Chital, Sambar deer, Wild boar, Gaur)",
            lifespan: "10 - 15 years in wild",
            weight: "180 - 260 kg (Male), 100 - 160 kg (Female)",
            length: "2.7 - 3.1 meters including tail",
            summary: "The Bengal tiger is an apex predator and the most numerous tiger subspecies. Revering an aura of power and stealth, individual stripe patterns are unique as human fingerprints.",
            funFacts: [
                "No two Bengal tigers have identical stripe patterns.",
                "Tigers are strong swimmers and frequently bathe in rivers to stay cool.",
                "A tiger's roar can be heard up to 3 kilometers away in dense forest."
            ],
            threats: ["Poaching for illegal wildlife trade", "Habitat fragmentation", "Human-wildlife conflict"],
            iconSymbol: "flame.fill",
            heroImageName: "tiger",
            taxonomy: Taxonomy(class: "Mammalia", order: "Carnivora", family: "Felidae", genus: "Panthera"),
            isFeatured: true,
            audioCallName: "tiger_roar"
        ),
        Species(
            commonName: "Snow Leopard",
            scientificName: "Panthera uncia",
            category: .mammal,
            conservationStatus: .vulnerable,
            habitat: "High alpine and subalpine zones (3,000 to 4,500m)",
            region: "Central & South Asia (Himalayas, Tibetan Plateau)",
            diet: "Carnivore (Blue sheep / Bharal, Asiatic ibex, Marmots)",
            lifespan: "15 - 18 years in wild",
            weight: "32 - 55 kg",
            length: "1.0 - 1.3 meters (plus a 1-meter balancing tail)",
            summary: "Often dubbed the 'Ghost of the Mountains', the snow leopard is an extraordinarily elusive cat adapted perfectly to rocky, freezing terrain with wide fur-cushioned paws.",
            funFacts: [
                "Their long thick tails act both as a counterbalance on cliffs and as a face-blanket while sleeping.",
                "Unlike other large felids, snow leopards cannot roar; they chuff, mew, and growl.",
                "Can leap horizontally up to 15 meters in a single bound."
            ],
            threats: ["Climate change shrinking alpine permafrost", "Retaliatory killings by herders", "Prey depletion"],
            iconSymbol: "mountain.2.fill",
            heroImageName: "snow_leopard",
            taxonomy: Taxonomy(class: "Mammalia", order: "Carnivora", family: "Felidae", genus: "Panthera"),
            isFeatured: true,
            audioCallName: "leopard_chuff"
        ),
        Species(
            commonName: "Bald Eagle",
            scientificName: "Haliaeetus leucocephalus",
            category: .bird,
            conservationStatus: .leastConcern,
            habitat: "Coastal zones, large lakes, estuaries, and river valleys",
            region: "North America (Canada, Alaska, Contiguous US)",
            diet: "Carnivore / Piscivore (Fish, waterfowl, carrion)",
            lifespan: "20 - 30 years in wild",
            weight: "3.0 - 6.3 kg",
            length: "Wingspan: 1.8 - 2.3 meters",
            summary: "The national bird of the United States, the Bald Eagle is a raptor known for piercing eyesight, soaring mastery, and massive stick nests built atop tall trees.",
            funFacts: [
                "Bald eagle nests can weigh over a ton and reach 3 meters in diameter.",
                "Their vision is 4 to 5 times sharper than human 20/20 vision.",
                "They can reach dive speeds over 160 km/h when swooping for fish."
            ],
            threats: ["Lead poisoning from fishing tackle and ammunition", "Power line collisions", "Disturbance of nest trees"],
            iconSymbol: "bird.fill",
            heroImageName: "bald_eagle",
            taxonomy: Taxonomy(class: "Aves", order: "Accipitriformes", family: "Accipitridae", genus: "Haliaeetus"),
            isFeatured: false,
            audioCallName: "eagle_screech"
        ),
        Species(
            commonName: "Blue Whale",
            scientificName: "Balaenoptera musculus",
            category: .marine,
            conservationStatus: .endangered,
            habitat: "Open ocean, polar shelf breaks, and deep pelagic trenches",
            region: "Global Oceans (Polar feeding grounds to tropical calving waters)",
            diet: "Carnivore / Filter feeder (Krill - up to 4 metric tons per day)",
            lifespan: "80 - 90 years",
            weight: "100 - 190 metric tons",
            length: "24 - 30 meters",
            summary: "The blue whale is the largest animal ever known to have lived on Earth. Its heart alone is the size of a small car, and its low-frequency pulses can travel hundreds of kilometers across ocean basins.",
            funFacts: [
                "A blue whale tongue weighs as much as an entire adult elephant.",
                "Their low-frequency vocalizations can reach 188 decibels, louder than a jet engine.",
                "A newborn blue whale calf drinks up to 400 liters of milk daily and gains 90 kg every 24 hours."
            ],
            threats: ["Ship strikes in commercial shipping lanes", "Ocean acoustic pollution", "Ocean warming affecting krill blooms"],
            iconSymbol: "water.waves",
            heroImageName: "blue_whale",
            taxonomy: Taxonomy(class: "Mammalia", order: "Artiodactyla", family: "Balaenopteridae", genus: "Balaenoptera"),
            isFeatured: true,
            audioCallName: "whale_song"
        ),
        Species(
            commonName: "Poison Dart Frog",
            scientificName: "Dendrobates tinctorius",
            category: .amphibian,
            conservationStatus: .leastConcern,
            habitat: "Primary tropical rainforest floor and leaf litter",
            region: "Northern South America (Guiana Shield)",
            diet: "Insectivore (Ants, termites, tiny beetles, mites)",
            lifespan: "5 - 10 years",
            weight: "3 - 8 grams",
            length: "3.5 - 5.0 cm",
            summary: "Renowned for dazzling aposematic coloration warning predators of lethal batrachotoxins, dart frogs derive their toxicity from the alkaloid-rich insects they consume in the rainforest.",
            funFacts: [
                "In captivity fed clean fruit flies, poison dart frogs lose their toxicity completely.",
                "Both male and female frogs show dedicated parental care, carrying tadpoles on their backs to bromeliad pools.",
                "Indigenous hunters used secretions from related species to coat hunting blowgun darts."
            ],
            threats: ["Deforestation of primary humid rainforest", "Chytrid fungal disease (Bd)", "Illegal pet trade"],
            iconSymbol: "drop.triangle.fill",
            heroImageName: "poison_frog",
            taxonomy: Taxonomy(class: "Amphibia", order: "Anura", family: "Dendrobatidae", genus: "Dendrobates"),
            isFeatured: false,
            audioCallName: "frog_peep"
        ),
        Species(
            commonName: "Monarch Butterfly",
            scientificName: "Danaus plexippus",
            category: .insect,
            conservationStatus: .vulnerable,
            habitat: "Meadows, prairies, agricultural borders, and oyamel fir forests",
            region: "North & South America (Famous 4,000 km annual migration)",
            diet: "Herbivore (Caterpillars feed exclusively on milkweed; adults sip nectar)",
            lifespan: "2 - 6 weeks (summer generations); 8 - 9 months (migrating super-generation)",
            weight: "0.25 - 0.75 grams",
            length: "Wingspan: 8.9 - 10.2 cm",
            summary: "Famous for an incredible multi-generational 4,000-kilometer migration from Canada to Mexican highland fir forests, navigation relies on a time-compensated sun compass in their antennae.",
            funFacts: [
                "It takes four successive generations of monarchs to complete their full annual migration cycle.",
                "Milkweed toxins (cardenolides) eaten during caterpillar stage make adult butterflies unpalatable to birds.",
                "Flap their wings between 300 to 720 times per minute during steady flight."
            ],
            threats: ["Loss of milkweed due to herbicide use", "Logging in Mexican overwintering oyamel reserves", "Severe weather events"],
            iconSymbol: "ant.fill",
            heroImageName: "monarch_butterfly",
            taxonomy: Taxonomy(class: "Insecta", order: "Lepidoptera", family: "Nymphalidae", genus: "Danaus"),
            isFeatured: false,
            audioCallName: nil
        ),
        Species(
            commonName: "Komodo Dragon",
            scientificName: "Varanus komodoensis",
            category: .reptile,
            conservationStatus: .endangered,
            habitat: "Tropical savanna, deciduous monsoon forest, and coastal ridges",
            region: "Indonesian Lesser Sunda Islands (Komodo, Rinca, Flores)",
            diet: "Carnivore (Deer, pigs, water buffalo, smaller dragons)",
            lifespan: "30 - 50 years",
            weight: "70 - 90 kg",
            length: "2.3 - 3.0 meters",
            summary: "The heaviest living lizard on the planet, possessing venom glands that secrete anticoagulants, serrated teeth, and an armored chainmail-like osteoderm skin.",
            funFacts: [
                "They can smell decaying carrion from up to 9.5 km away using their forked yellow tongue.",
                "A Komodo dragon can consume up to 80% of its own body weight in a single sitting.",
                "Young dragons live in trees for their first few years to avoid being eaten by adults."
            ],
            threats: ["Sea level rise threatening island coastlines", "Habitat conversion", "Prey poaching"],
            iconSymbol: "lizard.fill",
            heroImageName: "komodo_dragon",
            taxonomy: Taxonomy(class: "Reptilia", order: "Squamata", family: "Varanidae", genus: "Varanus"),
            isFeatured: false,
            audioCallName: "komodo_hiss"
        ),
        Species(
            commonName: "Red Panda",
            scientificName: "Ailurus fulgens",
            category: .mammal,
            conservationStatus: .endangered,
            habitat: "Temperate deciduous and conifer forests with dense bamboo understory",
            region: "Eastern Himalayas (Nepal, India, Bhutan, Northern Myanmar, SW China)",
            diet: "Herbivore / Omnivore (98% bamboo shoots & leaves, supplemented by berries and acorns)",
            lifespan: "8 - 12 years in wild",
            weight: "3.5 - 6.2 kg",
            length: "50 - 64 cm body + 37 - 47 cm bushy tail",
            summary: "A rust-colored acrobatic mammal with white teardrop facial markings and a ringed bushy tail. Though named panda, red pandas belong to their own distinct taxonomic family, Ailuridae.",
            funFacts: [
                "Like giant pandas, they have a false thumb—a modified wrist bone used to grip bamboo stalks.",
                "The soles of their feet are covered with thick white fur to insulate against snow and ice.",
                "They use their ringed tails as blankets to cover their heads in freezing Himalayan winds."
            ],
            threats: ["Habitat fragmentation", "Deforestation for firewood and agriculture", "Accidental trapping"],
            iconSymbol: "leaf.fill",
            heroImageName: "red_panda",
            taxonomy: Taxonomy(class: "Mammalia", order: "Carnivora", family: "Ailuridae", genus: "Ailurus"),
            isFeatured: true,
            audioCallName: "panda_whistle"
        )
    ]

    public static let sampleSightings: [Sighting] = [
        Sighting(
            speciesName: "Bengal Tiger",
            scientificName: "Panthera tigris tigris",
            category: .mammal,
            timestamp: Calendar.current.date(byAdding: .hour, value: -3, to: Date()) ?? Date(),
            latitude: 26.0173,
            longitude: 76.5026,
            locationName: "Ranthambore National Park, Zone 3 Lake",
            weather: .sunny,
            notes: "Observed magnificent adult female cooling off in lotus pond. Stayed for 20 minutes before slinking into the teak forest.",
            tags: ["#ApexPredator", "#LakeView", "#AdultFemale"],
            confidence: .confirmed,
            count: 1,
            imageSymbol: "flame.fill"
        ),
        Sighting(
            speciesName: "Bald Eagle",
            scientificName: "Haliaeetus leucocephalus",
            category: .bird,
            timestamp: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(),
            latitude: 51.1784,
            longitude: -115.5708,
            locationName: "Vermilion Lakes, Banff National Park",
            weather: .partlyCloudy,
            notes: "Pair perched on dead spruce branch overlooking early morning mist. One dived and caught a trout.",
            tags: ["#Raptor", "#Fishing", "#BreedingPair"],
            confidence: .confirmed,
            count: 2,
            imageSymbol: "bird.fill"
        ),
        Sighting(
            speciesName: "Snow Leopard",
            scientificName: "Panthera uncia",
            category: .mammal,
            timestamp: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(),
            latitude: 34.0754,
            longitude: 77.5673,
            locationName: "Hemis High Altitude National Park, Ladakh",
            weather: .snowy,
            notes: "Spotted through spotting scope on high ridgeline at 4,100m. Moving slowly across scree slope following blue sheep tracks.",
            tags: ["#GhostOfTheMountains", "#HighAltitude", "#Elusive"],
            confidence: .probable,
            count: 1,
            imageSymbol: "mountain.2.fill"
        ),
        Sighting(
            speciesName: "Blue Whale",
            scientificName: "Balaenoptera musculus",
            category: .marine,
            timestamp: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(),
            latitude: 36.6002,
            longitude: -121.8947,
            locationName: "Monterey Bay Submarine Canyon Edge",
            weather: .foggy,
            notes: "Immense blow detected 1.2 miles offshore, followed by broad mottled blue-gray back and tiny dorsal fin. Surfaced 4 times.",
            tags: ["#DeepPelagic", "#GentleGiant", "#KrillBloom"],
            confidence: .confirmed,
            count: 1,
            imageSymbol: "water.waves"
        ),
        Sighting(
            speciesName: "Monarch Butterfly",
            scientificName: "Danaus plexippus",
            category: .insect,
            timestamp: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date(),
            latitude: 19.6019,
            longitude: -100.2785,
            locationName: "Monarch Butterfly Biosphere Reserve, Michoacán",
            weather: .sunny,
            notes: "Dense cluster shivering together on oyamel fir branches waiting for sun warmth. Thousands took flight at midday.",
            tags: ["#MigrationCorridor", "#SuperGeneration", "#Sanctuary"],
            confidence: .confirmed,
            count: 450,
            imageSymbol: "ant.fill"
        )
    ]

    public static let sampleHabitats: [Habitat] = [
        Habitat(
            name: "Tropical Moist Rainforest",
            climate: "Warm & humid year-round, >2,000mm rainfall",
            coverage: "6% of Earth surface, holding 50% of terrestrial biodiversity",
            keyFeatures: ["Canopy layers", "Epiphytes & lianas", "Alkaloid-rich plant defense", "Extreme biodiversity"],
            threatLevel: "High (Commercial logging & cattle ranching)",
            representativeSpecies: ["Bengal Tiger", "Poison Dart Frog", "Jaguar", "Harpy Eagle"],
            iconSymbol: "leaf.arrow.triangle.circlepath",
            colorHex: "#1E3F20"
        ),
        Habitat(
            name: "Alpine Tundra & Glacial Ridges",
            climate: "Extreme cold, high winds, short growing season",
            coverage: "High elevation slopes above tree line",
            keyFeatures: ["Permafrost soil", "Low-lying cushion plants", "Steep scree terrain", "Thin atmosphere"],
            threatLevel: "Severe (Accelerated mountain warming & snow retreat)",
            representativeSpecies: ["Snow Leopard", "Himalayan Ibex", "Alpine Marmot", "Golden Eagle"],
            iconSymbol: "mountain.2.fill",
            colorHex: "#4A7C59"
        ),
        Habitat(
            name: "Pelagic & Coral Marine Ecosystems",
            climate: "Varied oceanic currents, deep trenches, sunny shallow banks",
            coverage: "71% of planet surface",
            keyFeatures: ["Coral calcification", "Krill upwelling zones", "Oceanic migratory corridors", "Hydrothermal vents"],
            threatLevel: "Critical (Ocean acidification, warming, overfishing)",
            representativeSpecies: ["Blue Whale", "Giant Manta Ray", "Green Sea Turtle", "Great White Shark"],
            iconSymbol: "water.waves",
            colorHex: "#2B6CB0"
        ),
        Habitat(
            name: "Savanna & Acacia Woodlands",
            climate: "Distinct wet and dry seasons, warm tropical grasslands",
            coverage: "20% of Earth land area",
            keyFeatures: ["Seasonal migrations", "Fire-adapted grasses", "Waterhole aggregations", "Apex predator guilds"],
            threatLevel: "Moderate (Encroachment, fencing, drought intensification)",
            representativeSpecies: ["African Bush Elephant", "Cheetah", "Lion", "Giraffe"],
            iconSymbol: "sun.max.fill",
            colorHex: "#E08D3C"
        )
    ]

    public static let sampleAchievements: [Achievement] = [
        Achievement(
            title: "First Step into the Wild",
            detail: "Log your first wildlife sighting in the field journal.",
            iconSymbol: "sparkles",
            requiredCount: 1,
            currentProgress: 1,
            isUnlocked: true,
            unlockedDate: Calendar.current.date(byAdding: .day, value: -7, to: Date())
        ),
        Achievement(
            title: "Avian Enthusiast",
            detail: "Spot and record 3 different wild bird species.",
            iconSymbol: "bird.fill",
            requiredCount: 3,
            currentProgress: 1,
            isUnlocked: false
        ),
        Achievement(
            title: "Apex Observer",
            detail: "Document 2 top-tier predators in their natural habitat.",
            iconSymbol: "flame.fill",
            requiredCount: 2,
            currentProgress: 2,
            isUnlocked: true,
            unlockedDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())
        ),
        Achievement(
            title: "Ocean Sentinel",
            detail: "Record 2 marine species sightings along coasts or open sea.",
            iconSymbol: "water.waves",
            requiredCount: 2,
            currentProgress: 1,
            isUnlocked: false
        ),
        Achievement(
            title: "Master Ranger",
            detail: "Log 10 confirmed encounters across multiple habitats.",
            iconSymbol: "trophy.fill",
            requiredCount: 10,
            currentProgress: 5,
            isUnlocked: false
        )
    ]

    public static let sampleSoundscapes: [Soundscape] = [
        Soundscape(
            title: "Amazon Canopy Chorus",
            subtitle: "Dawn awakening in the deep rainforest",
            duration: "15 min",
            environment: "Rainforest",
            iconSymbol: "leaf.fill",
            audioDescription: "Distant scarlet macaws calling over gentle falling canopy raindrops and humming cicadas.",
            ambientColorHex: "#2C5E3B"
        ),
        Soundscape(
            title: "Himalayan Ridge Wind",
            subtitle: "Serene alpine breeze and glacial melt",
            duration: "20 min",
            environment: "Alpine",
            iconSymbol: "mountain.2.fill",
            audioDescription: "Crisp wind blowing through Tibetan prayer flags with distant tumbling pebbles and whistling marmots.",
            ambientColorHex: "#3F627A"
        ),
        Soundscape(
            title: "Serengeti Dusk Symphony",
            subtitle: "Twilight savanna crickets and lion distant contact call",
            duration: "25 min",
            environment: "Savanna",
            iconSymbol: "sun.haze.fill",
            audioDescription: "Warm savanna breezes through tall grasses, nocturnal insects, and a resonant low lion call across the plains.",
            ambientColorHex: "#B86B2B"
        ),
        Soundscape(
            title: "Deep Pelagic Drift",
            subtitle: "Gentle underwater low-frequency whale songs",
            duration: "30 min",
            environment: "Marine",
            iconSymbol: "water.waves",
            audioDescription: "Resonant oceanic acoustics, bubbling current flows, and ethereal blue whale vocalizations.",
            ambientColorHex: "#1B4D6E"
        )
    ]
}
