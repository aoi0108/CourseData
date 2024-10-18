//
//  CourseTileView.swift
//  CourseData
//
//  Created by 平松蒼惟 on 2024/10/18.
//

import SwiftUI

struct CourseTileView: View {
    
    let course : Course
    
    var body: some View {
        ZStack{

            
            AsyncImage(url: URL(string: course.image)){ response in
                
                switch response{
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                    
                default:
                    DefaultImageView()
                }
                
            }
            VStack{
                Spacer()
                HStack{
                    Text(course.title)
                        .padding(.vertical, 4)
                        .padding(.horizontal)
                        .foregroundStyle(.white)
                        .bold()
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background{
                    Color.purple
                }
            }
            
        }
    }
}

#Preview {
    CourseTileView(course: Course(id: 1, image: "https://zappycode.com/media/course_images/CourseImageTake2NoBorder_A1jzclC.png", title: "iPhone Apps for Complete Beginners - Swift, SwiftUI & iOS17", subtitle: "You'll go from a complete beginner to having your own app in the App Store. Brand new (filmed Fall 2023) using Xcode 1"))
        .frame(height: 200)
}
