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
    if let image = image0 {
      let person0 = Person(fName: "Antonio", lName: "Garcia", facePic: image, yeaOrNay: true)
      people.append(person0)
    }
    
    if let image = image1 {
      let person1 = Person(fName: "Gigi", lName: "Hadid", facePic: image, yeaOrNay: false)
      people.append(person1)
    }
    
    if let image = image2 {
      let person2 = Person(fName: "Salma", lName: "Hayek", facePic: image, yeaOrNay: false)
      people.append(person2)
    }
    
    if let image = image3 {
      let person3 = Person(fName: "Emily", lName: "Ratajkowski", facePic: image, yeaOrNay: false)
      people.append(person3)
    }
    
    if let image = image4 {
      let person4 = Person(fName: "Adna", lName: "Seta", facePic: image, yeaOrNay: false)
      people.append(person4)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  //MARK - other methods
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //part 1 - dequeue cell
    let cell = tableView.dequeueReusableCellWithIdentifier("personCell", forIndexPath: indexPath)
    
    //part 2 - configure cell
    //cell.textLabel?.text = \(indexPath.row)"
    let personInfo = people[indexPath.row]
    cell.textLabel?.text = personInfo.firstName + " " + personInfo.lastName
    
    
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
}

