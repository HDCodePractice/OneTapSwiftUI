import SwiftUI

struct AppStorageControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "AppStorage", 
                    url: "https://developer.apple.com/documentation/swiftui/appstorage", 
                    description: "A property wrapper type that reflects a value from UserDefaults and invalidates a view on a change in value in that user default."
                )
                StoringSimpleValueView()
                Divider()
                StoringArrayView()
                Divider()
                StoringObjectArrayView()
                Divider()
            }
            .padding()
        }
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

struct StoringArrayView: View {
    var code : String{
        return """
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

struct StoringArrayView: View {
    @AppStorage("array") var array = ["0"]
    var body: some View {
        VStack{
            Text("Storing an array")
                .font(.title2)
            VStack{
                Text("Int array:\\( array.reduce("", {x,y in x+" "+y }) )")
                HStack{
                    Button("+"){ array.append("\\(array.count)")}
                    Button("-"){ 
                        if array.count>1 {
                            array.remove(at: array.count-1)
                        }
                    }
                }.buttonStyle(.borderedProminent)
            }
            .padding()
            .border(.secondary)
        }
    }
}
"""
    }
    @AppStorage("array") var array = ["0"]
    var body: some View {
        VStack{
            Text("Storing an array")
                .font(.title2)
            CodePreviewView(code: code)
            VStack{
                Text("**Int array**:\( array.reduce("", {x,y in x+" "+y }) )")
                HStack{
                    Button("+"){ array.append("\(array.count)")}
                    Button("-"){ 
                        if array.count>1 {
                            array.remove(at: array.count-1)
                        }
                    }
                }.buttonStyle(.borderedProminent)
            }
            .padding()
            .border(.secondary)
        }
    }
}

struct User:Codable,Hashable{
    var name: String
    var age: Int
}

struct StoringObjectArrayView: View {
    var code : String {
        return """
struct User{
    var name: String
    var age: Int
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

struct StoringObjectView: View {
        @AppStorage("object") var users = [User(name: "hdcola", age: 0)]
    var body: some View {
        VStack{
            Text("Storing a object")
                .font(.title2)
            HStack{
                VStack{
                    HStack{
                        ForEach(users,id:\\.self){ user in
                            Text("username:\\(user.name)\\(user.age)")
                        }
                    }
                    HStack{
                        Button("+"){ users.append(User(name: "hdcola", age: users.count)) }
                        Button("-"){ 
                            if users.count>1 {
                                users.remove(at: users.count-1)
                            }
                        }
                    }.buttonStyle(.borderedProminent)
                }
            }
            .padding()
            .border(.secondary)
        }
    }
}
"""
    }
    
    @AppStorage("object") var users = [User(name: "hdcola", age: 0)]
    var body: some View {
        VStack{
            Text("Storing a objects array")
                .font(.title2)
            CodePreviewView(code: code)
            HStack{
                VStack{
                    VStack{
                        ForEach(users,id:\.self){ user in
                            Text("username:\(user.name)\(user.age)")
                        }
                    }
                    HStack{
                        Button("+"){ users.append(User(name: "hdcola", age: users.count)) }
                        Button("-"){ 
                            if users.count>1 {
                                users.remove(at: users.count-1)
                            }
                        }
                    }.buttonStyle(.borderedProminent)
                }
            }
            .padding()
            .border(.secondary)
        }
    }
}


struct StoringSimpleValueView: View {
    var code : String{
        return """
struct StoringSimpleValueView: View {
    @AppStorage("count") var count = 0
    @AppStorage("count", store: UserDefaults(suiteName: "onetapswiftui.count")) var count2 = 0
    var body: some View {
        VStack{
            Text("Storing a value")
                .font(.title2)
            HStack(spacing: 20){
                VStack{
                    Text("**default suite count**: \\(count)")
                    HStack{
                        Button("+"){ count += 1}
                        Button("-"){ count -= 1}
                    }.buttonStyle(.borderedProminent)
                }.padding().border(.secondary)
                VStack{
                    Text("**different suite count2**: \\(count2)")
                    HStack{
                        Button("+"){ count2 += 1}
                        Button("-"){ count2 -= 1}
                    }.buttonStyle(.borderedProminent)
                }.padding().border(.secondary)
            }
        }
    }
}
"""
    }
    
    @AppStorage("count") var count = 0
    @AppStorage("count", store: UserDefaults(suiteName: "onetapswiftui.count")) var count2 = 0
    var body: some View {
        VStack{
            Text("Storing a value")
                .font(.title2)
            CodePreviewView(code: code)
            HStack(spacing: 20){
                VStack{
                    Text("**default suite count**: \(count)")
                    HStack{
                        Button("+"){ count += 1}
                        Button("-"){ count -= 1}
                    }.buttonStyle(.borderedProminent)
                }
                .padding()
                .border(.secondary)
                VStack{
                    Text("**different suite count2**: \(count2)")
                    HStack{
                        Button("+"){ count2 += 1}
                        Button("-"){ count2 -= 1}
                    }.buttonStyle(.borderedProminent)
                }
                .padding()
                .border(.secondary)
            }
        }
    }
}

struct AppStorageControlView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageControlView()
    }
}
