import UIKit

class Person: NSObject, NSCoding {
  var firstName : String = ""
  var lastName : String = ""
  var profilePic : UIImage?
  var hot : Bool?
  var personalAttribute1: String = ""
  var personalAttribute2: String = ""
  
  init(fName: String, lName: String, facePic: UIImage, yeaOrNay: Bool, att1: String, att2: String) {
    firstName = fName
    lastName = lName
    profilePic = facePic
    hot = yeaOrNay
    personalAttribute1 = att1
    personalAttribute2 = att2
  }
  
  //conforming to NSCoding protocol with init(coder) and encodeWithCoder() methods on all Person object properties
  required init(coder aDecoder: NSCoder){
    self.firstName = aDecoder.decodeObjectForKey("firstName") as! String
    self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
    if let data = aDecoder.decodeObjectForKey("profilePic") as? NSData{
      self.profilePic = UIImage(data: data)
    }
    self.personalAttribute1 = aDecoder.decodeObjectForKey("personalAttribute1") as! String
    self.personalAttribute2 = aDecoder.decodeObjectForKey("personalAttribute2") as! String
  }
  
  func encodeWithCoder(aCoder: NSCoder){
    aCoder.encodeObject(self.firstName, forKey: "firstName")
    aCoder.encodeObject(self.lastName, forKey: "lastName")
    if let image = profilePic {
      if let data = UIImagePNGRepresentation(image) {
        aCoder.encodeObject(data, forKey: "profilePic")
      }
    }
    aCoder.encodeObject(self.personalAttribute1, forKey: "personalAttribute1")
    aCoder.encodeObject(self.personalAttribute2, forKey: "personalAttribute2")
  }
}