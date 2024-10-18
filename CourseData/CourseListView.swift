//
//  ContentView.swift
//  CourseData
//
//  Created by 平松蒼惟 on 2024/10/18.
//

import SwiftUI

struct CourseListView: View {
    
    @State var courses: [Course] = []
    
    var body: some View {
        NavigationStack{
            if courses.count == 0{
                VStack{
                    ProgressView()
                        .padding()
                    Text("We're out grabbing the courses...")
                    
                }
                .foregroundStyle(Color.purple)
                .onAppear{
                    getCourses()
                }
            }else{
                ScrollView{
                    VStack(spacing: 20){
                        ForEach(courses){ course in
                            CourseTileView(course: course)
                        }
                    }
                }
                .navigationTitle("ZappyCode Courses")
            }
        }
       
    }
    
    func getCourses(){
        if let apiURL = URL(string: "https://zappycode.com/api/courses?format=json"){
            var request = URLRequest(url:apiURL)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let courseData = data{
                    //print(String(data: courseData, encoding: .utf8) ?? "ERROR")
                    
                    if let coursesFromAPI = try? JSONDecoder().decode([Course].self, from: courseData){
                        courses = coursesFromAPI
                        print(courses)
                    }
                    
                }
            }
            .resume()
        }
    }
}

#Preview {
    CourseListView()
}
