import UIKit

class Person {
  var firstName : String = ""
  var lastName : String = ""
  var profile : UIImage?
  var hot : Bool?
  var personalAttribute1: String = ""
  var personalAttribute2: String = ""
  
  init(fName: String, lName: String, facePic: UIImage, yeaOrNay: Bool, att1: String, att2: String) {
    firstName = fName
    lastName = lName
    profile = facePic
    hot = yeaOrNay
    personalAttribute1 = att1
    personalAttribute2 = att2
  }
}