import Foundation

public class Player{
    
    public var name: String
    public var highScore: Int
    public var bank: Int {
        didSet{
            if(bank > highScore){
                highScore = bank
            }
        }
    }
    
    public init(user: String = "New Player", deposit: Int = 20){
        bank = deposit
        name = user
        highScore = bank
    }
    
    public func withdraw (requestedAmount: Int)-> Bool{
        if(requestedAmount > self.bank){
            return false
        }
        bank -= requestedAmount
        requestedAmount
        return true
    }
    
}