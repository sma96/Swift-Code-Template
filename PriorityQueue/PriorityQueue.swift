import Foundation

struct PriorityQueue<T> {
    fileprivate var heap: Heap<T>
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.heap = Heap(sort: sort)
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    public func peek() -> T? {
        return heap.peek()
    }
    
    public mutating func enqueue(element: T) {
        heap.insert(element)
    }
    
    public mutating func dequeue() -> T? {
        return heap.remove()
    }

}
