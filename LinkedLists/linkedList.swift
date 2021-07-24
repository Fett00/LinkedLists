
fileprivate class Element<Value>{
    
    var value: Value
    var nextElement:Element?
    
    init(value:Value) {
        self.value = value
    }
}

/// Collection of linked values
struct LinkedList<Type> {
    
    private var _capacity: Int = 0
    private var head:Element<Type>?
    
    var capacity: Int{
        return _capacity
    }
    
    mutating func append(value:Type) {
        
        if head == nil{
            head = Element(value: value)
            _capacity += 1
        }
        else{
            var currentElement:Element? = head
            
            while true {
                if currentElement?.nextElement == nil{
                    break
                }
                currentElement = currentElement?.nextElement
            }
            currentElement?.nextElement = Element(value: value)
            _capacity += 1
        }
    }
    
    mutating func delete(indexOf:Int){
        
        if indexOf > _capacity{
            fatalError("Index out of range.")
        }
        
        if indexOf == 0{
            head = head?.nextElement
            _capacity -= 1
        }
        else{
            var currentElement:Element? = head
            for _ in 1..<indexOf{
                currentElement = currentElement?.nextElement
            }
            currentElement?.nextElement = currentElement?.nextElement?.nextElement
            
            _capacity -= 1
        }
    }
    
    subscript(key:Int) -> Type?{
        
        get{
            
            if key > _capacity{
                return nil
            }
            
            if key == 0{
                return head?.value
            }
            else{
                var currentElement:Element? = head
                
                for _ in 1...key{
                    currentElement = currentElement?.nextElement
                }
                return currentElement?.value
            }
        }
    }
}
