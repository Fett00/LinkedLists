
class Element<Value>{
    
    var value: Value
    var nextElement:Element?
    
    init(value:Value) {
        self.value = value
    }
}

struct LinkedList {
    
    private var _capacity: Int = 0
    private var head:Element<Any>?
    
    var capacity: Int{
        return _capacity
    }
    
    mutating func append(value:Any) {
        
        if head == nil{
            head = Element(value: value)
            _capacity += 1
        }
        else{
            var nextStepElement:Element? = head
            
            while true {
                if nextStepElement?.nextElement == nil{
                    break
                }
                nextStepElement = nextStepElement?.nextElement
            }
            nextStepElement?.nextElement = Element(value: value)
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
            var nextStepElement:Element? = head
            for _ in 1..<indexOf{
                nextStepElement = nextStepElement?.nextElement
            }
            nextStepElement?.nextElement = nextStepElement?.nextElement?.nextElement
            
            _capacity -= 1
        }
    }
    
    subscript(key:Int) -> Any{
        
        set{
            
            if key > _capacity{
                fatalError("Index out of range.")
            }
            
            if key == 0{
                head?.value = newValue
            }
            else{
                var nextStepElement:Element? = head
                
                for _ in 1...key{
                    nextStepElement = nextStepElement?.nextElement
                }
                nextStepElement?.value = newValue
            }
        }
        get{
            
            if key > _capacity{
                fatalError("Index out of range.")
            }
            
            if key == 0{
                return head?.value ?? -1
            }
            else{
                var nextStepElement:Element? = head
                
                for _ in 1...key{
                    nextStepElement = nextStepElement?.nextElement
                }
                return nextStepElement?.value ?? -1
            }
        }
    }
}
