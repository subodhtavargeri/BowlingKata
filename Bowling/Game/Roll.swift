struct Roll {
    
    var rolls: [Pin]
    
    mutating func append(pin: Pin) {
        rolls.append(pin)
    }
    
    func getRawValue(index: Int) -> Score {
        return rolls[index].rawValue
    }
}
