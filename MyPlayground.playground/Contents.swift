import UIKit


var StringExample: String = "Uddeshya Singh"
print(StringExample)

StringExample.insert(" ", at: StringExample.endIndex)
StringExample.insert(contentsOf: "Rajput", at: StringExample.endIndex)

func HelloWorld() -> Void {
    print("Hello world")
}

HelloWorld()

func SayHello(firstName: String) -> Void {
    print("Hello \(firstName)")
}

SayHello(firstName: "Uddeshya")
