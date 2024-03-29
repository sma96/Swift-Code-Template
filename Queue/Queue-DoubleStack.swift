import Foundation

public struct Queue<T> {
    fileprivate var inbox: [T] = [T]()
    fileprivate var outbox: [T] = [T]()
    
    public var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    public var count: Int {
        return inbox.count + outbox.count
    }
    
    public var front: T? {
        outbox.isEmpty ? inbox.first : outbox.last
    }
    
    public var back: T? {
        inbox.isEmpty ? outbox.first : inbox.last
    }
    
    public mutating func enqueue(_ element: T) {
        inbox.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if outbox.isEmpty {
            while !inbox.isEmpty {
                outbox.append(inbox.removeLast())
            }
        }
        if !outbox.isEmpty {
            return outbox.removeLast()
        }
        return nil
    }
}
