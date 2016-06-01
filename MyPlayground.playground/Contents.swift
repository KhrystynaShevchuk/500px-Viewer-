//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//func returnData() -> (data: NSData?, statusCode: Int)  {
//    return (NSData(), 300)
//}
//
//func executeURL(url: String, completion: (data: NSData?, statusCode: Int)) {
//    
//}
//
//executeURL("", completion: returnData())

func showInputAlert(text: String, isValid: (input: String?) -> Bool) {
    if isValid(input: text) {
        print("correct")
    }
    else {
        print("not correct")
    }
}


func isUsernameValid(input: String?) -> Bool {
    return input == "Alex"
}

func isEmailValid(input: String?) -> Bool {
    return input == "alex@gmail.com"
}


showInputAlert("Alex", isValid: isUsernameValid)




