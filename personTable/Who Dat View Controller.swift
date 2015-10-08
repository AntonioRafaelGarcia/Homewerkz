import UIKit

class WhoDatViewController: UIViewController {
  var doneSlided: Int = 50
  var personOfInterest: Person?
  @IBOutlet weak var showEm: UILabel!
  @IBOutlet weak var showTheirPic: UIImageView!
  @IBOutlet weak var sayTheyreLookingood: UITextView!
  @IBOutlet weak var hotTrueNotFalse: UILabel!
  
  //MARK - life cycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    if let person = personOfInterest {
      showEm.text = "\(person.firstName) \(person.lastName)"
      showTheirPic.image = person.profile
      sayTheyreLookingood.text = "\(person.firstName)'s lookin' pretty good, amirite?"
        if personOfInterest!.hot == true {
          hotTrueNotFalse.text = "TRUE"
        } else {
          hotTrueNotFalse.text = "FALSE"
        }
        }
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
}