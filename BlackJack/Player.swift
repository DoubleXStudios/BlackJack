import Foundation

//player objects have a name and a bank to store their winnings
public class Player{
    
    public var name: String
    public var bank: Int
    
    public init(user: String = "New Player", deposit: Int = 20){
        bank = deposit
        name = user
    }
    
    //take the money specified out of the bank if the amount they are trying to take out does not produce a negative bank value
    public func withdraw (requestedAmount: Int)-> Bool{
        if(requestedAmount > self.bank){
            return false
        }
        bank -= requestedAmount
        requestedAmount
        return true
    }
    
}