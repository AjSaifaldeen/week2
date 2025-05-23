struct Creature {
    let name: String
    let description: String
    let isGood: Bool
    let magicPower: Int
    
    // MARK: - Part 2: Computed property for ability
    var ability: String {
        let fibValue = fibonacciAbility(n: magicPower)
        return "\(name) channels the mystical power of \(fibValue) through their magical essence!"
    }
    
    // MARK: - Part 4: Mythical Creature Interactions
    func interactWith(_ otherCreature: Creature) -> String {
        switch (self.isGood, otherCreature.isGood) {
        case (true, true):
            return "🌟 \(self.name) and \(otherCreature.name) join forces in harmony, creating beautiful magical light!"
        case (false, false):
            return "⚡️ \(self.name) and \(otherCreature.name) clash in an epic battle of dark powers!"
        case (true, false):
            return "⚔️ \(self.name) bravely stands against the evil \(otherCreature.name) in a heroic confrontation!"
        case (false, true):
            return "⚔️ \(otherCreature.name) bravely stands against the evil \(self.name) in a heroic confrontation!"
        }
    }
}

// MARK: - Part 2: Fibonacci Creature Abilities
func fibonacciAbility(n: Int) -> Int {
    guard n > 0 else { return 0 }
    if n <= 2 { return 1 }
    
    var prev1 = 1
    var prev2 = 1
    var current = 0
    
    for _ in 3...n {
        current = prev1 + prev2
        prev2 = prev1
        prev1 = current
    }
    
    return current
}

// MARK: - Creating Creature Instances
let unicorn = Creature(
    name: "Celestial Unicorn",
    description: "A majestic white unicorn with a spiraling horn that glows with pure starlight",
    isGood: true,
    magicPower: 7
)

let dragon = Creature(
    name: "Shadow Dragon",
    description: "A massive black dragon with scales that absorb light and breathe dark fire",
    isGood: false,
    magicPower: 8
)

let phoenix = Creature(
    name: "Golden Phoenix",
    description: "A magnificent bird of fire that rises from ashes with wings of golden flame",
    isGood: true,
    magicPower: 6
)

let kraken = Creature(
    name: "Deep Sea Kraken",
    description: "An ancient tentacled beast from the ocean depths with crushing power",
    isGood: false,
    magicPower: 9
)

// MARK: - Part 3: The Mythical Creature Catalog
let creatureCatalog = [unicorn, dragon, phoenix, kraken]

// MARK: - Part 3 & 4: Describe Creatures Function
func describeCreature(creatures: [Creature]) {
    print("=== MYTHICAL CREATURES CATALOG ===\n")
    
    // Describe each creature and their abilities
    for (index, creature) in creatures.enumerated() {
        print("Creature #\(index + 1):")
        print("Name: \(creature.name)")
        print("Description: \(creature.description)")
        print("Alignment: \(creature.isGood ? "Good ✨" : "Evil 💀")")
        print("Magic Power Level: \(creature.magicPower)")
        print("Fibonacci Value: \(fibonacciAbility(n: creature.magicPower))")
        print("Special Ability: \(creature.ability)")
        print("---")
    }
    
    print("\n=== CREATURE INTERACTIONS ===\n")
    
    // Show interactions between all creature pairs
    for i in 0..<creatures.count {
        for j in (i+1)..<creatures.count {
            let interaction = creatures[i].interactWith(creatures[j])
            print(interaction)
        }
    }
}

// MARK: - Testing and Output
print("🦄 Welcome to the Mythical Creatures Playground! 🐉\n")

// Test individual creature properties
print("=== INDIVIDUAL CREATURE TESTS ===")
print("Unicorn's magic power: \(unicorn.magicPower)")
print("Unicorn's Fibonacci ability: \(fibonacciAbility(n: unicorn.magicPower))")
print("Dragon is good: \(dragon.isGood)")
print("Phoenix ability: \(phoenix.ability)")
print()

// Test Fibonacci function with different values
print("=== FIBONACCI SEQUENCE TESTS ===")
for i in 1...10 {
    print("Fibonacci(\(i)) = \(fibonacciAbility(n: i))")
}
print()

// Test individual interactions
print("=== SAMPLE INTERACTIONS ===")
print(unicorn.interactWith(dragon))
print(phoenix.interactWith(kraken))
print(unicorn.interactWith(phoenix))
print(dragon.interactWith(kraken))
print()

// Run the main describe function
describeCreature(creatures: creatureCatalog)

// MARK: - Additional Testing
print("\n=== CREATURE CATALOG SUMMARY ===")
print("Total creatures in catalog: \(creatureCatalog.count)")
print("Good creatures: \(creatureCatalog.filter { $0.isGood }.count)")
print("Evil creatures: \(creatureCatalog.filter { !$0.isGood }.count)")
print("Average magic power: \(creatureCatalog.map { $0.magicPower }.reduce(0, +) / creatureCatalog.count)")

print("\n🎉 Playground execution complete! 🎉")
