import Foundation

struct Queue<T> {
    private var array: [T] = [T]()
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func push(_ elements: T...) {
        elements.forEach({ array.append($0) })
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    func filter(_ closure: (T) -> Bool) -> [T] {
        return array.filter(closure)
    }
    
    subscript(_ index: UInt) -> T? {
        return array.count > index ? array[Int(index)] : nil
    }
    
    subscript(_ index: Int) -> T? {
        return index < 0 ? nil : array.count > index ? array[Int(index)] : nil
    }
}

extension Queue where T: Comparable {
    mutating func sortAscending() {
        array.sort { (leftElement: T, rightElement: T) -> Bool in
            return leftElement < rightElement
        }
    }
}
extension Queue where T: Equatable {
    func contains(element: T) -> Bool {
        return array.contains(element)
    }
}

var array = Queue<Int>()
print(array)
print(array[-1])
print(array.pop())
array.push(1, 1, 54, 2, 3,45,654,3)
array.push(7)
print(array[0])
print(array)
array.sortAscending()
print(array)
print(array.contains(element: 8))
print(array.contains(element: 3))
print(array.pop())
print(array)
print(array.filter({$0 % 2 == 0}))
