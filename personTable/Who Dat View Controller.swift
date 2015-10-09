import UIKit

class WhoDatViewController: UIViewController, UITextFieldDelegate {
  var doneSlided: Int = 50
  var personOfInterest: Person?
  @IBOutlet weak var showTheirPic: UIImageView!
  @IBOutlet weak var sayTheyreLookingood: UITextView!
  @IBOutlet weak var hotTrueNotFalse: UILabel!
  @IBOutlet weak var firstAttributeTextField: UITextField!
  @IBOutlet weak var secondAttributeTextField: UITextField!
  
  //MARK - life cycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    if let person = personOfInterest {
      showTheirPic.image = person.profile
      sayTheyreLookingood.text = "\(person.firstName) \(person.lastName)'s lookin' pretty good, amirite?"
        if personOfInterest!.hot == true {
          hotTrueNotFalse.text = "TRUE"
        } else {
          hotTrueNotFalse.text = "FALSE"
        }
        }
    updateFields()
    firstAttributeTextField.delegate = self
    secondAttributeTextField.delegate = self
    }
    
  //MARK - user methods
  @IBAction func sliderMoved(slider: UISlider) {
    doneSlided = lroundf(slider.value)
    if hotTrueNotFalse.text == "TRUE" {
      print("\(slider.value)/100 between hot and hot, eh?")
    } else {
      print("\(slider.value)/100 between hot and not, eh?")
    }
  }
  
  @IBAction func showAlert() {
    if let person = personOfInterest {
      let alert = UIAlertController(title: "Uh, yes'm!", message: "You designated \(person.firstName) \(person.lastName) as \(doneSlided)/100.You must be a connoisseur.", preferredStyle: .Alert)
      
      let action = UIAlertAction(title: "Whew!", style: .Default, handler: nil)
      
      alert.addAction(action)
      
      presentViewController(alert, animated: true, completion: nil)
    }
  }
  
  func updateFields () {
    if let person = personOfInterest{
      firstAttributeTextField.text = person.personalAttribute1
      secondAttributeTextField.text = person.personalAttribute2
    }
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    if let person = personOfInterest{
      person.personalAttribute1 = firstAttributeTextField.text
      person.personalAttribute2 = secondAttributeTextField.text
    }
    updateFields()
    textField.resignFirstResponder()
    return true
  }
}