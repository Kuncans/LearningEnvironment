//
//  CombineView.swift
//  LearningEnvironment
//
//  Created by Duncan Kent on 02/02/2022.
//
// https://youtu.be/fdxFp5vU6MQ

import SwiftUI
import Combine

// MODEL:
struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// VIEWMODEL:

final class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else { return }
        
        // 1. Sign up for monthly subscription for package to be delivered
        // 2. Company makes the package behind the scene
        // 3. Receive package at front door
        // 4. Check the box, ensure no damage
        // 5. Open and make sure the item is correct in the package
        // 6. Use the item
        // 7. Cancellable at any time
        
        // 1. Create the publisher
        URLSession.shared.dataTaskPublisher(for: url)
        // 2. Subscribe publisher on background thread (done automatically)
            .subscribe(on: DispatchQueue.global(qos: .background))
        // 3. Receive on main thread so that UI can update
            .receive(on: DispatchQueue.main)
        // 4. tryMap (checking that the data is good)
            .tryMap { (data, response) -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                        throw URLError(.badServerResponse)
                }
                return data
            }
        // 5. Decode (decode data into Model)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
        // 6. Sink (put the item into our app)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Completed Call")
                case .failure(let error):
                    print("Error \(error)")
                }
            } receiveValue: { [weak self] returnedPosts in
                self?.posts = returnedPosts
            }
        // 7. store (cancel subscription if needed)
            .store(in: &cancellables)

        
    }
    
}

// VIEW:
struct CombineView: View {
    
    @StateObject var vM = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vM.posts) { post in
                VStack (alignment: .leading) {
                    Text(post.title)
                        .font(.title)
                    Text(post.body)
                        .foregroundColor(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .listStyle(.plain)
    }
}

struct CombineView_Previews: PreviewProvider {
    static var previews: some View {
        CombineView()
    }
}


