//
//  ViewController.swift
//  TrendyolClone
//
//  Created by Macbook Air on 17.10.2022.
//

import UIKit
extension UIViewController {
    func showAlert(errTitle: String , errBody : String, secondTitle : String? , handlerFunction : (()-> Void)? )  {
        
        
        let alert = UIAlertController(title: errTitle, message: errBody, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        
        
        alert.addAction(alertAction)
        
        if secondTitle == nil {
            
            self.present(alert, animated: true)
            
        }else{
            
            
            if handlerFunction != nil {
                let secondAlertAction = UIAlertAction(title: secondTitle, style: .default, handler: { action in
                    handlerFunction
                })
                alert.addAction(secondAlertAction)
                self.present(alert, animated: true)

            }
            else{
                let secondAlertAction = UIAlertAction(title: secondTitle, style: .cancel)
                alert.addAction(secondAlertAction)
                self.present(alert, animated: true)
                
            }
        }
        
    }
}
class ViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {
    
    
    var searchSuggestions : [String] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var containerView: UIView!
    var session : URLSession!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        segmentedControl.selectedSegmentTintColor = .orange
        containerView.subviews.forEach{
            $0.removeFromSuperview()
        }
        switch segmentedControl.selectedSegmentIndex {
        case 0 :
            let view = MainMenuMan.MainMenuMann()
            containerView.addSubview(view)
            
            
            
       
            
            
            
            
            
        default:
            print("An unknown error occured")
            
        }
            
            
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.count >= 3 {
            suggestionsTable!.isHidden = false
            
        }else{
            
        }
    }
    @objc func changeTheSegment(){
        segmentedControl.selectedSegmentIndex += 1
        
    }
    var suggestionsTable : UITableView?
    
    @objc func closeToTheSuggestions(){
        suggestionsTable?.isHidden = true
        view.endEditing(true)
        
    }
    var myView : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.session = URLSession.shared
        self.suggestionsTable = UITableView(frame: CGRect(x: 0, y: 100, width: 330, height: 200))
        suggestionsTable!.delegate = self
        suggestionsTable!.dataSource = self
        view.addSubview(suggestionsTable!)
        suggestionsTable!.isHidden = true
        let closeSuggestionsGstr = UITapGestureRecognizer(target: self, action: #selector(closeToTheSuggestions))
        containerView.addGestureRecognizer(closeSuggestionsGstr)
        
        
        
        
        // Do any additional setup after loading the view.
    }


}

	
