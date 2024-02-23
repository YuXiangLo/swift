import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            TicTacToeView()
                .tabItem {
                    Label("Games", systemImage: "gamecontroller.fill")
                }
            MusicPage()
                .tabItem {
                    Label("Music", systemImage: "music.note")
                }
            VideoPage()
                .tabItem {
                    Label("Videos", systemImage: "video.fill")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
