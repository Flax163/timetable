import UIKit

class StartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var loadService:LoadScheduleService?
    var loadParameterSearchService:LoadParameterSearchService?
    var groups:Array<Group> = Array()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.loadService = LoadScheduleServiceImpl()
        self.loadParameterSearchService = LoadParametersearchServiceImpl()
    }
    
    func loadGroupComplete(groups: Array<Group>)
    {
        self.groups = groups
        self.tableView.reloadData()
        self.activityIndicator.stopAnimating()
    }
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        loadParameterSearchService!.loadGroups(loadGroupComplete)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return groups.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var seachCell:SearchTableCell = tableView.dequeueReusableCellWithIdentifier("searchCell") as! SearchTableCell
        
        seachCell.insertSearchName(groups[indexPath.row].name)
        return seachCell
    }

}

