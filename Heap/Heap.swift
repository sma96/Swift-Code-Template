import Foundation

struct Heap<T> {
    var nodes: [T] = []
    private var comp: (T, T) -> Bool
    
    public init (sort: @escaping (T, T) -> Bool) {
        self.comp = sort
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    @inline(__always) internal func parentIndex(of i: Int) -> Int {
        return (i - 1) / 2
    }
    
    @inline(__always) internal func leftChildIndex(of i: Int) -> Int {
        return 2*i + 1
    }
    
    @inline(__always) internal func rightChildIndex(of i: Int) -> Int {
        return 2*i + 2
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(index: nodes.count - 1)
    }

    
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            // 루트노트 요소를 삭제한다.
            
            nodes.swapAt(0, nodes.count - 1)
            let value = nodes.removeLast()
            // 마지막 요소를 루트노드로 이동시킨다.
            // shiftDown을 진행
            shiftDown(0)
            return value
        }
    }
    
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else {
            return nil
        }
        // error handle
        let size = nodes.count - 1
        if index != size {
            // index와 마지막 요소를 swap 한다
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index: index)
        }
        return nodes.removeLast()
    }
    
    internal mutating func shiftDown(_ index: Int) {
        self.shiftDown(from: index, until: nodes.count)
    }
    
    mutating func shiftDown(from index: Int, until endIndex: Int) {
        var currentIndex = index
        var childIndex = index
        
        var leftChildIndex = currentIndex*2 + 1
        var rightChildIndex = leftChildIndex + 1
        
        if leftChildIndex < endIndex && comp(nodes[leftChildIndex], nodes[currentIndex]) {
            childIndex = leftChildIndex
        }
        if rightChildIndex < endIndex && comp(nodes[rightChildIndex], nodes[childIndex]) {
            childIndex = rightChildIndex
        }
        if childIndex == index {
            return
        }
        
        nodes.swapAt(currentIndex, childIndex)
        
        currentIndex = childIndex
        
        while true {
            leftChildIndex = currentIndex*2 + 1
            rightChildIndex = leftChildIndex + 1
            
            if leftChildIndex < endIndex && comp(nodes[leftChildIndex], nodes[currentIndex]) {
                childIndex = leftChildIndex
            }
            if rightChildIndex < endIndex && comp(nodes[rightChildIndex], nodes[childIndex]) {
                childIndex = rightChildIndex
            }
            if currentIndex == childIndex {
                break
            }
            nodes.swapAt(currentIndex, childIndex)
            currentIndex = childIndex
        }
    }
    
    mutating func shiftUp(index: Int) {
        var parentIdx = parentIndex(of: index)
        var currentIdx = index
        
        while comp(nodes[currentIdx], nodes[parentIdx]) {
            nodes.swapAt(currentIdx, parentIdx)
            
            currentIdx = parentIdx
            parentIdx = parentIndex(of: currentIdx)
        }
    }
    
    mutating func replace(index: Int, value: T) {
        guard index < nodes.count else { return }
        
        remove(at: index)
        insert(value)
    }
}

