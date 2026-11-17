import Foundation

class TemplateStore {
    
    private let saveTemplateKey = "savedTemplates"
    
    //MARK: - Save Template
    func saveTemplate(_ template: Workout) -> Bool {
        
        var templates = loadTemplates()
        
        var temp = template
        
        for index in temp.exercises.indices {
            temp.exercises[index].weight = 0
            temp.exercises[index].sets = 0
            temp.exercises[index].reps = 0
        }
        
        templates.append(temp)
        temp.id = UUID()
        
        do {
            let encodedData = try JSONEncoder().encode(templates)
            
            UserDefaults.standard.set(encodedData, forKey: saveTemplateKey)
            
            print("Template saved successfully!")
            
            return true
        }catch {
            print("Error saving template: \(error)")
            
            return false
        }
    }
    
    //MARK: - Load Templates
    func loadTemplates() -> [Workout] {
        
        guard let savedData = UserDefaults.standard.data(forKey: saveTemplateKey) else {
            return []
        }
        
        do {
            return try JSONDecoder().decode([Workout].self, from: savedData)
        }catch {
            print("Error loading templates: \(error)")
            return []
        }
    }
    
//    //MARK: - Clear templates
//    func clearAllTemplates() {
//        var templates = loadTemplates()
//        templates.removeAll()
//        saveTemplate(<#Workout#>)
//    }
    
    
    
    
    
}
