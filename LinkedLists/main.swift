
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
            head = head?.nextElement
        }
        else{
            if indexOf > 1 {
                for _ in 1...indexOf-1 {
                    tempElement = tempElement?.nextElement
                }
            }
            tempElement?.nextElement = tempElement?.nextElement?.nextElement
        }
        _capacity -= 1
    }
    
    subscript(key:Int) -> Any{
        
        set{
            assert(key < _capacity, "Out of range.")
            if _capacity == 0{
                head = Element(value: newValue, link: nil)
                _capacity += 1
            }
            else if key == _capacity-1{
                var previousElement:Element? = head
                
                for _ in 0...key-1{
                    previousElement = previousElement?.nextElement
                }
                previousElement?.nextElement = Element(value: newValue, link: nil)
            }
            else{
                var previousElement:Element? = head
                
                for _ in 0...key-1{
                    previousElement = previousElement?.nextElement
                }
                previousElement?.nextElement = Element(value: newValue, link: previousElement?.nextElement?.nextElement)
            }
        }
        get{
            assert(key < capacity, "Out of range.")
            
            var tempElement:Element = head!
            
            for _ in 0..<key{
                tempElement = tempElement.nextElement!
            }
            return tempElement.value
        }
        
    }
    
}

