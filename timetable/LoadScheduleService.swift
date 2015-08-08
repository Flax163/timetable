import Foundation
import Kanna

protocol LoadScheduleService
{
    func loadScheduleForGroup(group: Group, dateStart: Date, dateEnd: Date)->Array<Schedule>
    
    func loadScheduleForTeacher(teachName: String, dateStart: Date, dateEnd: Date)->Array<Schedule>
    
    func loadScheduleForAudience(auditanceName: String, dateStart: Date, dateEnd: Date)->Array<Schedule>
}

class LoadScheduleServiceImpl: LoadScheduleService
{
    
    func loadScheduleForGroup(group: Group, dateStart: Date, dateEnd: Date)->Array<Schedule>
    {
        var url:NSURL = NSURL(string: LOAD_TOLGAS_TIMETABLE_URL)!
        var request2:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        request2.HTTPMethod = "POST"
        var bodyData:String = "rel=0&grp=177&prep=0&audi=0&vr=576&from=30.04.2015&to=30.06.2015&submit_button=ПОКАЗАТЬ"
        request2.HTTPBody = bodyData.dataUsingEncoding(NSWindowsCP1251StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request2, completionHandler:
        {
            data, response, error in

            var er:NSError? = nil
            var responseString:String = NSString(data: data, encoding: NSWindowsCP1251StringEncoding)! as String
            
            if let parser:HTMLDocument = Kanna.HTML(html: responseString, encoding: NSUTF8StringEncoding)
            {
                for node in parser.xpath(XPATCH_QUERY_FOR_LOAD_SCHELUDER)
                {
                    println(node.text)
                }
            }
        })
        
        task.resume()
        return Array<Schedule>()
    }
    
    func loadScheduleForTeacher(teachName: String, dateStart: Date, dateEnd: Date)->Array<Schedule>
    {
        return Array<Schedule>()
    }
    
    func loadScheduleForAudience(auditanceName: String, dateStart: Date, dateEnd: Date)->Array<Schedule>
    {
        return Array<Schedule>()
    }
}
/*TODO: можно сделать проще для имплементации
protocol LoadScheduleBuilder
{
    func forGroup(groupName: String)->LoadScheduleBuilder_StartChain
    
    func forTeacher(teachName: String)->LoadScheduleBuilder_StartChain
    
    func forAudience(auditanceName: String)->LoadScheduleBuilder_StartChain
}

protocol LoadScheduleBuilder_StartChain
{
    func dateStart(dateStart: Date)->LoadScheduleBuilder_ForeignParametersChain
}

protocol LoadScheduleBuilder_ForeignParametersChain
{
    func dateEnd(dateEnd: Date)->LoadScheduleBuilder_CompleteChain
}

protocol LoadScheduleBuilder_CompleteChain
{
    func load()->Array<Schedule>
}

class LoadScheduleBuilderImpl : LoadScheduleBuilder
{
    private var data:SearchData!
    private var loadScheduleService:LoadScheduleService!
    
    init(loadScheduleService: LoadScheduleService)
    {
        super.init();
        self.loadScheduleService = loadScheduleService;
    }
    
    func forGroup(groupName: String)->LoadScheduleBuilder_StartChain
    {
        self.data = SearchData(nameGroup: groupName)
        return LoadScheduleBuilder_StartChainImpl(searchData: data)
    }
    
    func forTeacher(teachName: String)->LoadScheduleBuilder_StartChain
    {
        self.data = SearchData(nameTeach: teachName)
        return LoadScheduleBuilder_StartChainImpl(searchData: data)
    }
    
    func forAudience(auditanceName: String)->LoadScheduleBuilder_StartChain
    {
        self.data = SearchData(nameAudience: auditanceName)
        return LoadScheduleBuilder_StartChainImpl(searchData: data)
    }
}

class LoadScheduleBuilder_StartChainImpl : LoadScheduleBuilder_StartChain
{
    private var loadScheduleService:LoadScheduleService!
    private var data:SearchData!
    private var dateSearch:DateSearch!
    
    init(loadScheduleService: LoadScheduleService, data: SearchData)
    {
        self.loadScheduleService = loadScheduleService;
        self.data = data
    }
    
    func dateStart(dateStart: Date!)->LoadScheduleBuilder_ForeignParametersChain
    {
        self.data = DateSearch(dateStart: dateStart)
        return LoadScheduleBuilder_ForeignParametersChainImpl(searchData: date, dateSearch: dateSearch)
    }
}

class LoadScheduleBuilder_ForeignParametersChainImpl : LoadScheduleBuilder_ForeignParametersChain
{
    private var loadScheduleService:LoadScheduleService!
    private var data:SearchData!
    private var dateSearch:DateSearch!
    
    init(loadScheduleService: LoadScheduleService, searchData:SearchData, dateSearch:DateSearch)
    {
        self.loadScheduleService = loadScheduleService;
        self.data = searchData
        self.dateSearch = dateSearch
    }
    
    func dateEnd(dateEnd: Date!)->LoadScheduleBuilder_CompleteChain
    {
        self.dateSearch.dateEnd = dateEnd;
        return
    }
}

class LoadScheduleBuilder_CompleteChainImpl: LoadScheduleBuilder_CompleteChain
{
    private var data:SearchData!
    private var dateSearch:DateSearch!
    
    init(searchData:SearchData, dateSearch:DateSearch)
    {
        self.data = searchData
        self.dateSearch = dateSearch
    }
    
}*/




struct SearchData
{
    private var nameGroup:String
    private var nameTeach:String
    private var nameAudience:String
    
    init(nameGroup:String = "", nameTeach:String = "", nameAudience:String = "")
    {
        self.nameGroup = nameGroup;
        self.nameTeach = nameTeach
        self.nameAudience = nameAudience
    }
}

struct DateSearch
{
    var dateStart:Date
    var dateEnd:Date
    
    init(dateStart:Date, dateEnd:Date)
    {
        self.dateStart = dateStart
        self.dateEnd = dateEnd
    }
}

