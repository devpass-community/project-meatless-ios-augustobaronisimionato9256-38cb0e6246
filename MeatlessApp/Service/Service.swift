import Foundation

struct Service {
    
    func fetchRestaurantList(completion: @escaping ([Restaurant]?)->Void) {
        // STORY 1: Implement the API integration to fetch restaurant list.
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/meatless-api/main/restaurant_list.json") else { return }
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error { return }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let restaurants = try decoder.decode([Restaurant].self, from: data)
                
            } catch {
                
            }
        }

        task.resume()
    }
}
