import Foundation
import UIKit

class StartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate
{
    var loadService:LoadScheduleService?
    var loadParameterSearchService:LoadParameterSearchService?
    var groups:Array<Group> = Array()
    var displayGroup:Array<Group> = Array()
    var searchActive:Bool = false
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tabBar: UITabBar!
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.loadService = LoadScheduleServiceImpl()
        self.loadParameterSearchService = LoadParametersearchServiceImpl()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        loadParameterSearchService!.loadGroups(
            {groups in
                self.groups = [Group(id: "1", name: "ololo"), Group(id: "1", name: "ololo")]
                self.displayGroup = [Group(id: "1", name: "ololo"), Group(id: "1", name: "ololo")]
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return groups.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let seachCell:SearchTableCell = tableView.dequeueReusableCellWithIdentifier("searchCell", forIndexPath: indexPath) as! SearchTableCell
        seachCell.insertSearchName(displayGroup[indexPath.row].name)
        return seachCell
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String)
    {
        displayGroup = groups.filter({ (group : Group) -> Bool in
            return (group.name.rangeOfString(searchText) != nil)
        })
        
        self.tableView.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let identity = segue.identifier
        {
            switch identity
            {
            case "test":
                
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let checkDataViewController:CheckDataViewController = segue.destinationViewController as! CheckDataViewController
                
            default:
                break
            }
        }
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool
    {
        return true
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool
    {
        return false
    }
}