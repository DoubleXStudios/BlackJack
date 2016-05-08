import Foundation

public class Player{
    
    public var name: String
    public var bank: Int
    
    public init(user: String = "New Player", deposit: Int = 20){
        bank = deposit
        name = user
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