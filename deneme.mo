actor {
  stable var num : Nat = 0;
  
  public func decrement () : async Nat{
    if (num != 0){
      num -= 1 ;
    };

     return num;
  };

  public func inc () : async Nat {
    num +=1;
    return num;
  };

  public func getNum () : async Nat {
    return num;
  };

  public func reset () : async Nat {
    num := 0;
    return num;
  };
};
