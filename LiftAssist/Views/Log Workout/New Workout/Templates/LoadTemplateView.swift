import SwiftUI

struct LoadTemplateView: View {
    
    @State private var templates: [Workout] = []

        private let templateStore = TemplateStore()
    
    var onSelectTemplate: (Workout) -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
             
                Text("Load Template")
                    .font(.title2)
                    .fontWeight(.bold)
                
                
                ForEach(templates) { workout in
                    
                    Button {
                        onSelectTemplate(workout)
                    } label: {
                        ClickButton(title: workout.name)
                    }
                    
                }
                
                
                
                
                
                
                
                
                
            }
            .padding()
        }
        .onAppear{
            templates = templateStore.loadTemplates()
        }
    }
}
