import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  var people = [Person]()
  @IBOutlet weak var tableView: UITableView!

  //MARK - life cycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    let person0 = Person(fName: "Antonio", lName: "Garcia")
    let person1 = Person(fName: "Gigi", lName: "Hadid")
    let person2 = Person(fName: "Salma", lName: "Hayek")
    let person3 = Person(fName: "Emily", lName: "Ratajkowski")
    let person4 = Person(fName: "Adna", lName: "Seta")
    
    people = [person0, person1, person2, person3, person4]
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
}

