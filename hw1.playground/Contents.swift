//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?


//: Different Types; the instance variables are of type String, and the values passed in to the init function are String optional.


//: ## Q2: Variable Types and Function Types
    class func arePalindromes(words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reverse())}
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
//: ### Why does the compiler dislike the **for loop**? Fix it.
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: 1) Compiler dislikes the CONSTANT "i" in the for loop loop; "i" is an immutable object, so we can't use it as a counter. Change "let" to "var. 2) numElements could be renamed as Constant (use Let instead of Var) since it is never changed. In addition, func arePalindromes is an INSTANCE FUNCTION. CODE AT BOTTOM calls Words.arePalindromes (uses it as CLASS FUNCTION).  Therefore, we must change arePalindromes from an instance function to class function by adding "class" to method signature.  In addition, it was orignally possible for the function to NOT RETURN ANYTHING (did not have return true logic).  The method must return a boolean value.  Fix this by adding "return true".

//: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters : [Character : Int] = [Character : Int]()
        let lenA = self.wordA.characters.count //instance member wordA cannot be used on type 'Words'
        let lenB = self.wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters) //char Array of wordA
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 { // "i" is the index of each element in wordA
            let letter = arrA[i] // letter = element (character) of wordA
            if let val = countLetters[letter] { // val = countLetters[letter]-->gives you COUNT(int) of the character in dictionary unwrapped
                //if there is a value (count) corresponding to the (char) "letter" in the dictionary, then...
                countLetters[letter] = val + 1 // increment that count by 1 in the dictionary
            } else {
                countLetters[letter] = 1 //else: set count to 1
            }
        } //count the number of chars in WordA
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
//: ### What is the problem with declaring **countLetters** as we do in **Line X**,
//: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.

//:Error: countLetters was DECLARED in Line X, but NOT INITIALIZED (it had a null value). Thus, at Line Y ("if let val = countLetters[letter]") it was USED BEFORE BEING INITIALIZED. Fix this by INITIALIZING countLetters dictionary in Line X. isAnagram() is a CLASS FUNC as declared originally. However, CODE BELOW calls isAnagram() on an INSTANCE of class words (uses it as instance function). Fix this by changing isAnagram() to instance function by getting rid of CLASS.  isAnagram() is also declared to be a boolean function, but last line had a "return nil"; should be changed to returning a boolean (possibly true), since true is not returned anywhere previously.  CHANGE TO "RETURN TRUE".
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(["hih", "racecar", "mom", "wow"])
Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
