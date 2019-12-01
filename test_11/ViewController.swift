
import CoreLocation
import UIKit

struct Weather : Decodable {
    var coord : WeatherLocation?
   
}
struct WeatherLocation : Decodable {
    var lon : Double
    var lat : Double
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=ukrainka&APPID=dbd3b02d8958d62185d02e944cd5f522"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce , error) in
            
            guard let data = data else  { return }
            guard error == nil else { return }
            
            do {
            let weather = try JSONDecoder().decode(Weather.self, from: data)
            print(weather)
            }catch let error{
                print(error)
               }
            }.resume()
        }
    }


