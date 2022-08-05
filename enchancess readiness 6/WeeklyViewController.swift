import UIKit

class WeeklyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
   
    var selectedDate = Date()
    var totalSqaures = [Date]()
    
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
    }
    
    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setMonthView()
    {
        totalSqaures.removeAll()
 
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while (current < nextSunday)
        {
            totalSqaures.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
            
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate)
        + " " + CalendarHelper().yearString(date: selectedDate)
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSqaures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        
        let date = totalSqaures[indexPath.item]
        cell.dayOfMonth.text = String(CalendarHelper().daysOfMonth(date: date))
        
        if(date == selectedDate)
        {
            cell.backgroundColor = UIColor.systemGreen
        }
        else
        {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedDate = totalSqaures[indexPath.item]
        collectionView.reloadData()
    }
    
    @IBAction func previousWeek(_ sender: Any)
    {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setMonthView()
    }
    
    @IBAction func nextWeek(_ sender: Any)
    {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setMonthView()
    }
    
    override open var shouldAutorotate: Bool
    {
        return false
    }
        
}
