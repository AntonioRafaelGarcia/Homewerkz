import UIKit

class Person {
  var firstName : String = ""
  var lastName : String = ""
  var profile : UIImage?
  var hot : Bool?
  
  init(fName: String, lName: String, facePic: UIImage, yeaOrNay: Bool) {
    firstName = fName
    lastName = lName
    profile = facePic
    hot = yeaOrNay
  }
}