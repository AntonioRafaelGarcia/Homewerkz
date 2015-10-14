import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  var people = [Person]()
  let image0 = UIImage(named: "antonioGarcia.jpg")
  let image1 = UIImage(named: "gigiHadid.jpg")
  let image2 = UIImage(named: "salmaHayek.jpg")
  let image3 = UIImage(named: "emilyRatajkowski.jpg")
  let image4 = UIImage(named: "adnaSeta.jpg")
  @IBOutlet weak var tableView: UITableView!

  //MARK - life cycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    if let whatLoaded = loadFromArchive(){
      people = whatLoaded
    } else {
      if let image = image0 {
        let person0 = Person(fName: "Antonio", lName: "Garcia", facePic: image, yeaOrNay: true, att1: "", att2: "")
        people.append(person0)
      }
      
      if let image = image1 {
        let person1 = Person(fName: "Gigi", lName: "Hadid", facePic: image, yeaOrNay: false, att1: "", att2: "")
        people.append(person1)
      }
      
      if let image = image2 {
        let person2 = Person(fName: "Salma", lName: "Hayek", facePic: image, yeaOrNay: false, att1: "", att2: "")
        people.append(person2)
      }
      
      if let image = image3 {
        let person3 = Person(fName: "Emily", lName: "Ratajkowski", facePic: image, yeaOrNay: false, att1: "", att2: "")
        people.append(person3)
      }
      
      if let image = image4 {
        let person4 = Person(fName: "Adna", lName: "Seta", facePic: image, yeaOrNay: false, att1: "", att2: "")
        people.append(person4)
      }
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
    saveToArchive()
  }
  
  //MARK - other methods
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //part 1 - dequeue cell
    let cell = tableView.dequeueReusableCellWithIdentifier("personCell", forIndexPath: indexPath) as! PersonTableViewCell
    
    //part 2 - configure cell
    //cell.textLabel?.text = \(indexPath.row)"
    let personInfo = people[indexPath.row]
    cell.personCellNameLabel?.text = personInfo.firstName + " " + personInfo.lastName
    if personInfo.personalAttribute1.characters.count > 1 && personInfo.personalAttribute2.characters.count > 1 {
      cell.personCellTraitsLabel?.text = personInfo.personalAttribute1 + ", " + personInfo.personalAttribute2
    } else {
      cell.personCellTraitsLabel?.text = ""
    }
    cell.personCellImage?.image = personInfo.profilePic
    
    //part 3 - return cell to table
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let nextViewController = segue.destinationViewController as? WhoDatViewController{
      if let tableClick = tableView.indexPathForSelectedRow {
        nextViewController.personOfInterest = people[tableClick.row]
      }
    }
  }
  
  func saveToArchive(){
    //get path to documents directory
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    //archive
    NSKeyedArchiver.archiveRootObject(self.people, toFile: documentsPath + "/archive")
  }
  
  func loadFromArchive() -> [Person]? {
    //get path to document directory in sandbox
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    //attempt to unarchive object graph
    if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [Person]{
      return peopleFromArchive
    }
    return nil
  }
}