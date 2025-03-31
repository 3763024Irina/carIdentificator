//
//  ContentView.swift
//  carIdentificator
//
//  Created by Irina on 31/3/25.
//
import SwiftUI

// Модель данных
struct Car: Identifiable {
    let id = UUID()
    let name: String
    let year: Int
    let description: String
    let imageName: String
}

// Данные для отображения
let cars = [
    Car(name: "Volkswagen Beetle", year: 1938, description: "Легендарный компактный автомобиль, выпускавшийся с 1938 года. Известен своей уникальной формой и стал символом доступного транспорта. За 81 год производства было продано 23 миллиона экземпляров по всему миру.", imageName: "beetle"),
    Car(name: "Ford Model T", year: 1908, description: "Первый массовый автомобиль, произведенный с использованием конвейерной сборки. Выпускался с 1908 по 1927 год и сделал автомобили доступными для широких масс, революционизировав автомобильную промышленность.", imageName: "model_t"),
    Car(name: "Porsche 911", year: 1964, description: "Спортивный автомобиль, впервые представленный в 1964 году. Отличается заднемоторной компоновкой и узнаваемым дизайном. Считается эталоном спортивных купе и продолжает выпускаться по сей день.", imageName: "porsche_911"),
    Car(name: "Jaguar E-Type", year: 1961, description: "Выпускался с 1961 по 1975 год. Известен своим элегантным дизайном с обтекаемым кузовом. Энцо Феррари назвал его \"самым красивым автомобилем в истории\".", imageName: "jaguar_etype"),
    Car(name: "Ferrari F40", year: 1987, description: "Суперкар, выпущенный в 1987 году в честь 40-летия компании. Оснащен легким кузовом из углеродного волокна и двигателем V8 с двойным турбонаддувом мощностью 478 л.с. Устанавливал новые стандарты для суперкаров своего времени.", imageName: "ferrari_f40"),
    Car(name: "Lamborghini Miura", year: 1966, description: "Выпускался с 1966 по 1973 год. Первый суперкар с задним центральным расположением двигателя на два места. Оснащен мощным двигателем V12 и считается предшественником современных суперкаров.", imageName: "lamborghini_miura"),
    Car(name: "Audi Quattro", year: 1980, description: "Выпускался с 1980 по 1991 год. Первый серийный автомобиль с постоянным полным приводом, доминировавший в Чемпионате мира по ралли и доказавший преимущества полного привода в автоспорте.", imageName: "audi_quattro"),
    Car(name: "BMW M3 (E30)", year: 1986, description: "Выпускался с 1986 по 1992 год. Разработан для участия в гоночных сериях, сочетает легкий кузов и мощный двигатель, что сделало его успешным как на трассе, так и на рынке.", imageName: "bmw_m3_e30"),
    Car(name: "Bugatti Veyron", year: 2005, description: "Выпускался с 2005 по 2015 год. Гиперкар с 8,0-литровым двигателем W16 мощностью 1001 л.с., разгоняющийся до 100 км/ч за 2,6 секунды и достигающий максимальной скорости 407 км/ч.", imageName: "bugatti_veyron"),
    Car(name: "Chevrolet Corvette", year: 1953, description: "Представленный в 1953 году, Corvette стал синонимом производительности и стиля, став культовым американским спортивным автомобилем, значительно повлиявшим на автомобильную промышленность.", imageName: "chevrolet_corvette")
]

// Главный экран с таблицей
struct ContentView: View {
    var body: some View {
        NavigationView {
            List(cars) { car in
                NavigationLink(destination: DetailView(car: car)) {
                    Text("\(car.name) (Год выпуска: \(car.year.formatted(.number.grouping(.never))))")

                }
            }
            .navigationTitle("Автомобили")
        }
    }
}

// Детальный экран
struct DetailView: View {
    let car: Car
    
    var body: some View {
        VStack {
            Image(car.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()
            
            Text(car.name)
                .font(.largeTitle)
                .padding(.bottom, 5)
            
            Text("\(car.name) (Год выпуска: \(car.year.formatted(.number.grouping(.never))))")
                .font(.headline)
                .padding(.bottom, 5)
            
            Text(car.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationTitle(car.name)
    }
}

// Запуск приложения
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
