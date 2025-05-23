//struct Creature {
//    let name: String
//    let description: String
//    let isGood: Bool
//    let magicPower: Int
//    
//    // MARK: - Part 2: Computed property for ability
//    var ability: String {
//        let fibValue = fibonacciAbility(n: magicPower)
//        return "\(name) channels the mystical power of \(fibValue) through their magical essence!"
//    }
//    
//    // MARK: - Part 4: Mythical Creature Interactions
//    func interactWith(_ otherCreature: Creature) -> String {
//        switch (self.isGood, otherCreature.isGood) {
//        case (true, true):
//            return "🌟 \(self.name) and \(otherCreature.name) join forces in harmony, creating beautiful magical light!"
//        case (false, false):
//            return "⚡️ \(self.name) and \(otherCreature.name) clash in an epic battle of dark powers!"
//        case (true, false):
//            return "⚔️ \(self.name) bravely stands against the evil \(otherCreature.name) in a heroic confrontation!"
//        case (false, true):
//            return "⚔️ \(otherCreature.name) bravely stands against the evil \(self.name) in a heroic confrontation!"
//        }
//    }
//}
//
//// MARK: - Part 2: Fibonacci Creature Abilities
//func fibonacciAbility(n: Int) -> Int {
//    guard n > 0 else { return 0 }
//    if n <= 2 { return 1 }
//    
//    var prev1 = 1
//    var prev2 = 1
//    var current = 0
//    
//    for _ in 3...n {
//        current = prev1 + prev2
//        prev2 = prev1
//        prev1 = current
//    }
//    
//    return current
//}
//
//// MARK: - Creating Creature Instances
//let unicorn = Creature(
//    name: "Celestial Unicorn",
//    description: "A majestic white unicorn with a spiraling horn that glows with pure starlight",
//    isGood: true,
//    magicPower: 7
//)
//
//let dragon = Creature(
//    name: "Shadow Dragon",
//    description: "A massive black dragon with scales that absorb light and breathe dark fire",
//    isGood: false,
//    magicPower: 8
//)
//
//let phoenix = Creature(
//    name: "Golden Phoenix",
//    description: "A magnificent bird of fire that rises from ashes with wings of golden flame",
//    isGood: true,
//    magicPower: 6
//)
//
//let kraken = Creature(
//    name: "Deep Sea Kraken",
//    description: "An ancient tentacled beast from the ocean depths with crushing power",
//    isGood: false,
//    magicPower: 9
//)
//
//// MARK: - Part 3: The Mythical Creature Catalog
//let creatureCatalog = [unicorn, dragon, phoenix, kraken]
//
//// MARK: - Part 3 & 4: Describe Creatures Function
//func describeCreature(creatures: [Creature]) {
//    print("=== MYTHICAL CREATURES CATALOG ===\n")
//    
//    // Describe each creature and their abilities
//    for (index, creature) in creatures.enumerated() {
//        print("Creature #\(index + 1):")
//        print("Name: \(creature.name)")
//        print("Description: \(creature.description)")
//        print("Alignment: \(creature.isGood ? "Good ✨" : "Evil 💀")")
//        print("Magic Power Level: \(creature.magicPower)")
//        print("Fibonacci Value: \(fibonacciAbility(n: creature.magicPower))")
//        print("Special Ability: \(creature.ability)")
//        print("---")
//    }
//    
//    print("\n=== CREATURE INTERACTIONS ===\n")
//    
//    // Show interactions between all creature pairs
//    for i in 0..<creatures.count {
//        for j in (i+1)..<creatures.count {
//            let interaction = creatures[i].interactWith(creatures[j])
//            print(interaction)
//        }
//    }
//}
//
//// MARK: - Testing and Output
//print("🦄 Welcome to the Mythical Creatures Playground! 🐉\n")
//
//// Test individual creature properties
//print("=== INDIVIDUAL CREATURE TESTS ===")
//print("Unicorn's magic power: \(unicorn.magicPower)")
//print("Unicorn's Fibonacci ability: \(fibonacciAbility(n: unicorn.magicPower))")
//print("Dragon is good: \(dragon.isGood)")
//print("Phoenix ability: \(phoenix.ability)")
//print()
//
//// Test Fibonacci function with different values
//print("=== FIBONACCI SEQUENCE TESTS ===")
//for i in 1...10 {
//    print("Fibonacci(\(i)) = \(fibonacciAbility(n: i))")
//}
//print()
//
//// Test individual interactions
//print("=== SAMPLE INTERACTIONS ===")
//print(unicorn.interactWith(dragon))
//print(phoenix.interactWith(kraken))
//print(unicorn.interactWith(phoenix))
//print(dragon.interactWith(kraken))
//print()
//
//// Run the main describe function
//describeCreature(creatures: creatureCatalog)
//
//// MARK: - Additional Testing
//print("\n=== CREATURE CATALOG SUMMARY ===")
//print("Total creatures in catalog: \(creatureCatalog.count)")
//print("Good creatures: \(creatureCatalog.filter { $0.isGood }.count)")
//print("Evil creatures: \(creatureCatalog.filter { !$0.isGood }.count)")
//print("Average magic power: \(creatureCatalog.map { $0.magicPower }.reduce(0, +) / creatureCatalog.count)")
//
//print("\n🎉 Playground execution complete! 🎉")


////MARK:- New futuers are here!

import Foundation

// MARK: - Part 1: Enhanced Creature Struct with New Features
struct Creature {
    let name: String
    let description: String
    let isGood: Bool
    let magicPower: Int
    
    // NEW: Additional properties for enhanced functionality
    let element: Element
    let rarity: Rarity
    let habitat: String
    var experiencePoints: Int = 0
    
    // NEW: Enum for creature elements
    enum Element: String, CaseIterable {
        case fire = "🔥"
        case water = "💧"
        case earth = "🌍"
        case air = "💨"
        case light = "✨"
        case shadow = "🌑"
        case nature = "🌿"
        case ice = "❄️"
    }
    
    // NEW: Enum for creature rarity
    enum Rarity: String, CaseIterable {
        case common = "Common"
        case rare = "Rare"
        case epic = "Epic"
        case legendary = "Legendary"
        case mythical = "Mythical"
        
        var multiplier: Double {
            switch self {
            case .common: return 1.0
            case .rare: return 1.5
            case .epic: return 2.0
            case .legendary: return 2.5
            case .mythical: return 3.0
            }
        }
    }
    
    // UPDATED: Enhanced ability calculation with rarity multiplier
    var ability: String {
        let baseFibValue = fibonacciAbility(n: magicPower)
        let enhancedPower = Int(Double(baseFibValue) * rarity.multiplier)
        return "\(name) \(element.rawValue) harnesses \(rarity.rawValue.lowercased()) power of \(enhancedPower) through their \(element.rawValue) essence!"
    }
    
    // NEW: Power level calculation
    var powerLevel: Int {
        return Int(Double(magicPower + experiencePoints) * rarity.multiplier)
    }
    
    // NEW: Creature type description
    var creatureType: String {
        return "\(rarity.rawValue) \(element.rawValue) \(isGood ? "Guardian" : "Terror")"
    }
    
    // UPDATED: Enhanced interaction system with element compatibility
    func interactWith(_ otherCreature: Creature) -> InteractionResult {
        let elementCompatibility = checkElementalCompatibility(with: otherCreature.element)
        let powerDifference = abs(self.powerLevel - otherCreature.powerLevel)
        
        switch (self.isGood, otherCreature.isGood) {
        case (true, true):
            let outcome = elementCompatibility == .synergy ? "perfect harmony" : "peaceful alliance"
            return InteractionResult(
                description: "🌟 \(self.name) and \(otherCreature.name) form a \(outcome), their \(self.element.rawValue)\(otherCreature.element.rawValue) energies creating beautiful magic!",
                expGained: 15 + (elementCompatibility == .synergy ? 10 : 0),
                outcome: .alliance
            )
            
        case (false, false):
            let battleIntensity = powerDifference > 50 ? "devastating" : "fierce"
            return InteractionResult(
                description: "⚡️ \(self.name) and \(otherCreature.name) engage in a \(battleIntensity) battle, their \(self.element.rawValue)\(otherCreature.element.rawValue) powers clashing violently!",
                expGained: 20 + (powerDifference > 50 ? 15 : 0),
                outcome: .conflict
            )
            
        case (true, false), (false, true):
            let hero = self.isGood ? self : otherCreature
            let villain = self.isGood ? otherCreature : self
            let advantageText = elementCompatibility == .advantage ? " with elemental advantage" : ""
            return InteractionResult(
                description: "⚔️ \(hero.name) courageously confronts \(villain.name)\(advantageText), light battling darkness in an epic showdown!",
                expGained: 25 + (elementCompatibility == .advantage ? 10 : 0),
                outcome: .heroicConfrontation
            )
        }
    }
    
    // NEW: Element compatibility system
    private func checkElementalCompatibility(with otherElement: Element) -> ElementalRelation {
        let compatibilityMap: [Element: [Element]] = [
            .fire: [.ice, .nature],
            .water: [.fire, .earth],
            .earth: [.air, .water],
            .air: [.earth, .fire],
            .light: [.shadow],
            .shadow: [.light],
            .nature: [.fire, .ice],
            .ice: [.fire, .nature]
        ]
        
        let synergyMap: [Element: [Element]] = [
            .fire: [.air],
            .water: [.nature],
            .earth: [.nature],
            .air: [.fire],
            .light: [.nature],
            .shadow: [.ice],
            .nature: [.earth, .water, .light],
            .ice: [.shadow]
        ]
        
        if let advantages = compatibilityMap[self.element], advantages.contains(otherElement) {
            return .advantage
        } else if let synergies = synergyMap[self.element], synergies.contains(otherElement) {
            return .synergy
        } else {
            return .neutral
        }
    }
    
    // NEW: Mutating function to gain experience
    mutating func gainExperience(_ amount: Int) {
        experiencePoints += amount
    }
}

// NEW: Interaction result structure
struct InteractionResult {
    let description: String
    let expGained: Int
    let outcome: InteractionOutcome
    
    enum InteractionOutcome {
        case alliance, conflict, heroicConfrontation
    }
}

// NEW: Elemental relation enum
enum ElementalRelation {
    case advantage, synergy, neutral
}

// UPDATED: Enhanced Fibonacci function with memoization
private var fibonacciCache: [Int: Int] = [:]

func fibonacciAbility(n: Int) -> Int {
    guard n > 0 else { return 0 }
    if n <= 2 { return 1 }
    
    // Check cache first
    if let cached = fibonacciCache[n] {
        return cached
    }
    
    // Calculate and cache result
    let result = fibonacciAbility(n: n - 1) + fibonacciAbility(n: n - 2)
    fibonacciCache[n] = result
    return result
}

// UPDATED: Enhanced creature instances with new properties
var unicorn = Creature(
    name: "Celestial Unicorn",
    description: "A majestic white unicorn with a spiraling horn that channels pure starlight",
    isGood: true,
    magicPower: 7,
    element: .light,
    rarity: .legendary,
    habitat: "Enchanted Forest Clearings"
)

var dragon = Creature(
    name: "Shadow Dragon",
    description: "A massive obsidian dragon whose scales absorb light and breathe void flames",
    isGood: false,
    magicPower: 8,
    element: .shadow,
    rarity: .mythical,
    habitat: "Ancient Mountain Caves"
)

var phoenix = Creature(
    name: "Golden Phoenix",
    description: "A magnificent firebird that rises eternally from sacred golden ashes",
    isGood: true,
    magicPower: 6,
    element: .fire,
    rarity: .epic,
    habitat: "Volcanic Crater Nests"
)

var kraken = Creature(
    name: "Deep Sea Kraken",
    description: "An ancient leviathan with tentacles that command the crushing depths",
    isGood: false,
    magicPower: 9,
    element: .water,
    rarity: .legendary,
    habitat: "Abyssal Ocean Trenches"
)

// NEW: Additional creatures for variety
var iceWolf = Creature(
    name: "Frost Wolf Alpha",
    description: "A spectral wolf whose breath freezes the very air around it",
    isGood: true,
    magicPower: 5,
    element: .ice,
    rarity: .rare,
    habitat: "Frozen Tundra Peaks"
)

var earthGolem = Creature(
    name: "Ancient Stone Guardian",
    description: "A massive golem carved from mountain stone, protector of sacred grounds",
    isGood: true,
    magicPower: 7,
    element: .earth,
    rarity: .epic,
    habitat: "Sacred Stone Circles"
)

// UPDATED: Expanded creature catalog
var creatureCatalog = [unicorn, dragon, phoenix, kraken, iceWolf, earthGolem]

// UPDATED: Enhanced describe function with new features
func describeCreature(creatures: inout [Creature]) {
    print("🏰 === MYTHICAL CREATURES COMPENDIUM === 🏰\n")
    
    // Enhanced creature descriptions
    for (index, creature) in creatures.enumerated() {
        print("📜 Creature Entry #\(index + 1):")
        print("🏷️  Name: \(creature.name)")
        print("📖 Description: \(creature.description)")
        print("🏠 Habitat: \(creature.habitat)")
        print("⚖️  Type: \(creature.creatureType)")
        print("🔮 Element: \(creature.element.rawValue) \(creature.element)")
        print("⭐ Rarity: \(creature.rarity.rawValue) (×\(creature.rarity.multiplier))")
        print("🎯 Magic Power: \(creature.magicPower)")
        print("📊 Experience: \(creature.experiencePoints) XP")
        print("💪 Power Level: \(creature.powerLevel)")
        print("🌟 Special Ability: \(creature.ability)")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    }
    
    print("\n⚔️ === CREATURE INTERACTIONS & BATTLES === ⚔️\n")
    
    // Enhanced interactions with experience gain
    var interactionCount = 0
    for i in 0..<creatures.count {
        for j in (i+1)..<creatures.count {
            interactionCount += 1
            let result = creatures[i].interactWith(creatures[j])
            print("🎭 Encounter #\(interactionCount):")
            print(result.description)
            print("📈 Experience Gained: \(result.expGained) XP each")
            
            // Apply experience gain
            creatures[i].gainExperience(result.expGained)
            creatures[j].gainExperience(result.expGained)
            print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        }
    }
}

// NEW: Advanced analysis functions
func analyzeCreatureStats(creatures: [Creature]) {
    print("\n📊 === ADVANCED CREATURE ANALYTICS === 📊")
    
    // Rarity distribution
    print("\n🎲 Rarity Distribution:")
    let rarityGroups = Dictionary(grouping: creatures, by: { $0.rarity })
    for rarity in Creature.Rarity.allCases {
        let count = rarityGroups[rarity]?.count ?? 0
        print("   \(rarity.rawValue): \(count) creatures")
    }
    
    // Element distribution
    print("\n🌟 Elemental Distribution:")
    let elementGroups = Dictionary(grouping: creatures, by: { $0.element })
    for element in Creature.Element.allCases {
        let count = elementGroups[element]?.count ?? 0
        if count > 0 {
            print("   \(element.rawValue) \(element): \(count) creatures")
        }
    }
    
    // Power statistics
    let powers = creatures.map { $0.powerLevel }
    print("\n💪 Power Level Statistics:")
    print("   Highest: \(powers.max() ?? 0)")
    print("   Lowest: \(powers.min() ?? 0)")
    print("   Average: \(powers.reduce(0, +) / powers.count)")
    
    // Good vs Evil balance
    let goodCount = creatures.filter { $0.isGood }.count
    let evilCount = creatures.count - goodCount
    print("\n⚖️ Moral Alignment:")
    print("   Good: \(goodCount) (\(Int(Double(goodCount)/Double(creatures.count)*100))%)")
    print("   Evil: \(evilCount) (\(Int(Double(evilCount)/Double(creatures.count)*100))%)")
}

// NEW: Creature tournament system
func runCreatureTournament(creatures: [Creature]) {
    print("\n🏆 === CREATURE POWER TOURNAMENT === 🏆")
    
    let sortedCreatures = creatures.sorted { $0.powerLevel > $1.powerLevel }
    
    print("\n🥇 Tournament Rankings:")
    for (index, creature) in sortedCreatures.enumerated() {
        let medal = index == 0 ? "🥇" : index == 1 ? "🥈" : index == 2 ? "🥉" : "🏅"
        print("   \(medal) #\(index + 1): \(creature.name) - Power Level: \(creature.powerLevel)")
    }
    
    if sortedCreatures.count >= 2 {
        let champion = sortedCreatures[0]
        let runner = sortedCreatures[1]
        print("\n👑 FINAL CHAMPIONSHIP MATCH:")
        let result = champion.interactWith(runner)
        print(result.description)
    }
}

// MARK: - Enhanced Testing and Execution
print("🌟 Welcome to the Enhanced Mythical Creatures Playground! 🌟\n")

// Test new features
print("=== NEW FEATURES DEMONSTRATION ===")
print("🔥 Phoenix Element: \(phoenix.element) \(phoenix.element.rawValue)")
print("⭐ Dragon Rarity: \(dragon.rarity.rawValue) (×\(dragon.rarity.multiplier) multiplier)")
print("💪 Unicorn Power Level: \(unicorn.powerLevel)")
print("🏷️  Kraken Type: \(kraken.creatureType)")
print()

// Enhanced Fibonacci testing
print("=== OPTIMIZED FIBONACCI SEQUENCE ===")
let startTime = CFAbsoluteTimeGetCurrent()
for i in 1...15 {
    print("Fib(\(i)) = \(fibonacciAbility(n: i))")
}
let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
print("⏱️ Calculation time: \(String(format: "%.4f", timeElapsed)) seconds")
print()

// Run all enhanced functions
describeCreature(creatures: &creatureCatalog)
analyzeCreatureStats(creatures: creatureCatalog)
runCreatureTournament(creatures: creatureCatalog)

print("\n🎊 Enhanced playground execution complete! 🎊")
print("💡 New features: Elements, Rarity, Experience, Analytics, Tournament!")
