import UIKit

func bubbleSort(_ list: [Int]) -> [Int] {
    var listToSort = list
        
    for i in 0..<listToSort.count-1 {
        for j in 0..<listToSort.count-1-i {
            if listToSort[j] > listToSort[j+1] {
                listToSort.swapAt(j, j+1)
            }
        }
    }
    
    return listToSort
}

func selectionSort(_ list: [Int]) -> [Int] {
    var listToSort = list
    
    for i in 0..<listToSort.count-1 {
        var minIndex = i
        for j in i..<listToSort.count-1 {
            if listToSort[j] < listToSort[minIndex] {
                minIndex = j
            }
            
            listToSort.swapAt(i, minIndex)
        }
    }
    
    return listToSort
}

func insertionSort(_ list: [Int]) -> [Int] {
    var sortedList = list
    
    for i in 1..<sortedList.count-1 {
        var j = i
        while j > 0 && sortedList[j] < sortedList[j-1] {
            sortedList.swapAt(j, j-1)
            j = j-1
        }
    }
    
    return sortedList
}


//print(bubbleSort([4, 5, 1, 9, 6, 100]))
//print(selectionSort([4, 5, 1, 9, 6, 100]))
print(insertionSort([4, 5, 1, 9, 6, 100]))


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func middleNode(_ head: ListNode?) -> ListNode? {
        var length = 0
        var traversalHead = head
        
        while traversalHead != nil {
            length += 1
            traversalHead = traversalHead?.next
        }
        
        length = length%2 == 0 ? length/2 + 1 : length/2
        traversalHead = head
    
        print("middleElementPosition - \(length)")
        return traversalHead
    }

// 1 2 3 4
middleNode(ListNode(1, ListNode(2, ListNode(3, ListNode(4)))))
