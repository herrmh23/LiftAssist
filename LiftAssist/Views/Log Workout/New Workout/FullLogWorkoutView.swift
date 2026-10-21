import SwiftUI

struct FullLogWorkoutView: View {
    
    @EnvironmentObject var workoutStore: WorkoutStore
    @State private var workoutName = ""
    @State private var workoutExercises: [WorkoutExercise] = []
    @State private var showingAddExercise = false
    @State private var showingSaveError = false
    @State private var saveErrorMessage = ""
    @State private var showingSaveSuccess = false
    @State private var showingSaveTemplateError = false
    @State private var saveTemplateErrorMessage = ""
    @State private var showingSaveTemplateSuccess = false
    @State private var showingLoadTemplates = false
    @State private var editingExercise: WorkoutExercise?
    
    private let templateStore = TemplateStore()
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Log Today's Workout")
                    .font(.title2)
                    .fontWeight(.bold)
                
                
                //load template button
                Button {
                    showingLoadTemplates = true
                } label: {
                    HomeButton(
                        title: "Load Template",
                        subtitle: "Use a pre-created workout",
                        icon: nil
                    )
                }
                .buttonStyle(.plain)
                .sheet(isPresented: $showingLoadTemplates) {
                    NavigationStack {
                        LoadTemplateView{ selectedTemplate in
                        applyTemplate(selectedTemplate)
                        showingLoadTemplates = false
                        }
                    }
                    .presentationDragIndicator(.visible)
                }
                
                
                Text("New Workout")
                    .font(.title2)
                    .fontWeight(.bold)
                
                //MARK: - Workout Name Text Field
                Text("Workout Name")
                    .font(.headline)
                
                TextField("Ex: Leg Day", text: $workoutName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                
                //MARK: - Add exercises button and sheet
                Button{
                    showingAddExercise = true
                } label: {
                    VStack(spacing: 8) {
                        
                        Image(systemName: "plus.circle")
                            .font(.system(size: 40))
                        
                        Text("Add Exercise")
                            .font(.headline)
                    }
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 25)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .sheet(isPresented: $showingAddExercise) {
                    NavigationStack {
                        AddExerciseView {
                            newExercise in
                            workoutExercises.append(newExercise)
                            showingAddExercise = false
                        }
                    }
                    .presentationDragIndicator(.visible)
                }
                
                
                //MARK: - Added exercises display
                ForEach(workoutExercises) {workoutExercise in
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text(workoutExercise.exercise.name)
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(
                                "\(workoutExercise.weight.formatted()) lbs"
                            )
                            .fontWeight(.bold)
                            
                            Text(
                                "\(workoutExercise.sets) sets x \(workoutExercise.reps) reps"
                            )
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            
                            Button {
                                workoutExercises.removeAll {$0.id == workoutExercise.id}
                            } label: {
                                Image(systemName: "trash")
                                    .font(.headline)
                                    .frame(width: 20)
                            }
                            .foregroundStyle(.red)
                            .padding()
                            
                            Button {
                                editingExercise = workoutExercise
                            } label: {
                                Image(systemName: "pencil")
                                    .font(.headline)
                                    .frame(width: 20)
                            }
                            .foregroundStyle(.gray)
                            .padding()
                            .sheet(item: $editingExercise) {lift in
                                
                                LogExerciseDataView(
                                    onAddExercise: { updatedLift in
                                        
                                        if let index = workoutExercises.firstIndex(
                                            where: { $0.id == updatedLift.id }
                                        ) {
                                            workoutExercises[index] = updatedLift
                                        }
                                        
                                        editingExercise = nil
                                    },
                                    exercise: lift.exercise,
                                    existingLift: lift
                                )
                                
                            }
                            
                            
                        }
                        .padding()
                        .frame(alignment: .leading)
                        
                    }
                    Divider()
                        
                    }
                    
                    
                    //MARK: - Save Buttons
                    //save as exercise button
                    Button {
                        
                        //prevents trailing or leading spaces
                        let name = workoutName.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        )
                        
                        //Check workout name
                        guard !name.isEmpty else {
                            saveErrorMessage = "Please enter a workout name."
                            showingSaveError = true
                            return
                        }
                        
                        //Check there are exercies
                        guard !workoutExercises.isEmpty else {
                            saveErrorMessage = "Please add at least one exercise."
                            showingSaveError = true
                            return
                        }
                        
                        
                        //create workout
                        let workout = Workout(
                            name: workoutName,
                            date: Date(),
                            exercises: workoutExercises
                        )
                        
                        workoutStore.saveWorkout(workout)
                        
                        //show save success
                        showingSaveSuccess = true
                        

                        //let savedWorkouts = workoutStore.loadWorkouts()

                        
                    } label: {
                        ClickButton(title: "Save As Workout")
                    }
                    .alert("Cannot Save Workout", isPresented: $showingSaveError) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text(saveErrorMessage)
                    }
                    .alert("Workout Saved!", isPresented: $showingSaveSuccess) {
                        Button( "Ok") {
                            
                            //clear logged workout
                            workoutName = ""
                            workoutExercises.removeAll()
                        }
                    } message: {
                        Text("Your workout has been logged today! Good Job!")
                    }
                    
                    
                    
                    //MARK: - save as template button
                    Button {
                        
                        //prevents trailing or leading spaces
                        let name = workoutName.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        )
                        
                        //Check workout name
                        guard !name.isEmpty else {
                            saveErrorMessage = "Please enter a workout name."
                            showingSaveError = true
                            return
                        }
                        
                        //Check there are exercies
                        guard !workoutExercises.isEmpty else {
                            saveErrorMessage = "Please add at least one exercise."
                            showingSaveError = true
                            return
                        }
                        
                        let workout = Workout(
                            name: workoutName,
                            date: Date(),
                            exercises: workoutExercises
                        )
                        
                        templateStore.saveTemplate(workout)
                        
                        showingSaveTemplateSuccess = true
                        
                    } label: {
                        ClickButton(
                            title: "Save As Template",
                        )
                    }
                    .buttonStyle(.plain)
                    .alert("Cannot Save Template", isPresented: $showingSaveTemplateError) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text(saveErrorMessage)
                    }
                    .alert("Template Saved!", isPresented: $showingSaveTemplateSuccess) {
                        Button("Ok") {
                            
                        }
                    } message: {
                        Text("Your workout has been saved as a template")
                    }
                    
                    
                    
                    
                }

            }
            .padding()
            
            Spacer()
        }
        
        
        
        //MARK: - Function to add the template exercises to the workout
    func applyTemplate(_ template: Workout) {
        
        let loadedWorkout = Workout(
            name: template.name,
            date: Date(),
            exercises: template.exercises.map { lift in
                WorkoutExercise(
                    exercise: lift.exercise,
                    weight: 0,
                    sets: 0,
                    reps: 0
                )
            }
        )
        
        workoutName = loadedWorkout.name
        workoutExercises = loadedWorkout.exercises
    }
        
        
        
        
        
        
        
        
        
        
        
        
    }

