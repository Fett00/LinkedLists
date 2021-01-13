
class Element{
    
    var value: Any
    var nextElement:Element?
    
    init(value:Any,link:Element?) {
        self.value = value
        self.nextElement = link
    }
}

struct LinkedList {
    
    private var _capacity: Int = 0
    private var head:Element? = nil
    
    var capacity: Int{
        return _capacity
    }
    
    mutating func append(value:Any) {
        if _capacity == 0{
            head = Element(value: value, link: nil)
            _capacity += 1
        }
        else{
            var lastElement:Element? = head
            
            while lastElement?.nextElement != nil {
                lastElement = lastElement?.nextElement
            }
            
            lastElement?.nextElement = Element(value: value, link: nil)
            _capacity = _capacity + 1
        }
    }
    
    mutating func delete(indexOf:Int){
        assert(indexOf < _capacity, "Out of range.")
        var tempElement:Element? = head
        
        
        if indexOf == 0 {
            head = tempElement?.nextElement
        }
        else if indexOf == 1{
            tempElement?.nextElement = tempElement?.nextElement?.nextElement
        }
        else{
            for _ in 0..<indexOf-1{
                tempElement = tempElement?.nextElement
                
            }
            tempElement?.nextElement = tempElement?.nextElement?.nextElement
        }
        _capacity -= 1
    }
    
    subscript(key:Int) -> Any{
        
        set{
            assert(key < _capacity, "Out of range.")
            
            var tempElement:Element? = head
            
            if key == 0{
                tempElement = Element(value: newValue, link: tempElement?.nextElement)
            }
            else if key == 1{
                tempElement?.nextElement = Element(value: newValue, link: tempElement?.nextElement?.nextElement)
            }
            else{
                for _ in 0..<key-1{
                    tempElement = tempElement?.nextElement
                }
            }
            
            tempElement?.nextElement = Element(value: newValue, link: tempElement?.nextElement?.nextElement)
        }
        get{
            assert(key < capacity, "Out of range.")
            
            var tempElement:Element? = head
            
            for _ in 0..<key{
                tempElement = tempElement?.nextElement
            }
            return tempElement?.value ?? -1
        }
    }
}
