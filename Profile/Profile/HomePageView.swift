import SwiftUI

struct HomePageView: View {
    @State private var currentIndex: Int = 0
    private let images = ["pic2", "pic1", "pic0", "pic3"]
    @GestureState private var swipeOffset: CGFloat = 0

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Profile Image
                Image("ME")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(radius: 10)

                // Name and Title
                Text("YuXiang Luo")
                    .font(.title)
                    .fontWeight(.heavy)

                // Contact Information
                contactInformationSection

                // Experience Section
                experienceSection

                // Education Section
                educationSection
                
                // Animated Image Stack (Smart Stack)
                photoSection
            }
            .padding()
        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.55)
        )
        .navigationTitle("Profile")
    }

    var contactInformationSection: some View {
        Group {
            HStack {
                Image(systemName: "phone.fill")
                Text("+886 908-780-503")
            }

            HStack {
                Image(systemName: "envelope.fill")
                Text("linus13514@gmail.com")
            }

            HStack {
                Image(systemName: "link")
                Text("https://github.com/YuXiangLo")
            }
        }
    }

    var experienceSection: some View {
        VStack(alignment: .leading) {
            Text("Experience")
                .font(.headline)
                .padding(.top, 5)
                .fontWeight(.heavy)

            Text("• Research Assistant – Academia Sinica")
            Text("• APCS Camp Instructor")
            Text("• Full Stack Web Development")
        }
    }

    var educationSection: some View {
        VStack(alignment: .leading) {
            Text("Education")
                .font(.headline)
                .padding(.top, 5)
                .fontWeight(.heavy)

            Text("• National Taiwan University")
            Text("\t• Undergraduate of Computer Science").fontWeight(.light)
        }
    }
    
    var photoSection: some View {
        VStack(alignment: .leading) {
            Text("About ME")
                .font(.headline)
                .fontWeight(.heavy)
            
            TabView {
                ForEach(images, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .padding()
                }
            }
            .frame(width: 350, height: 350) // Set the height of the image carousel
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
