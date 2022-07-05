//
//  ContentView.swift
//  MyUnitTesting
//
//  Created by terry on 2022/7/4.
//

import SwiftUI


struct ContentView: View {
    @StateObject var vm: MyViewModel
    
    init() {
        _vm = StateObject(wrappedValue: MyViewModel(isGray: true))
    }
    
    var body: some View {
        VStack {
            Button {
                vm.getInfo()
            } label: {
                Text("扫描")
                    .font(.title)
            }
            .padding()
            
            Divider()
                .padding(.vertical)
         
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text("名字: ")
                    Spacer()
                    Text(vm.currentPerson.name ?? "-")
                }
                
                HStack{
                    Text("手机: ")
                    Spacer()
                    Text(vm.currentPerson.phone ?? "-")
                }
                
                HStack{
                    Text("居住地: ")
                    Spacer()
                    Text(vm.currentPerson.location ?? "-")
                }
                
                HStack{
                    Text("最近一次检测时间: ")
                    Spacer()
                    Text(vm.currentPerson.latestDate ?? "-")
                }
            }
            
            Divider()
                .padding(.vertical)
            
            if vm.currentPerson.recordList.count == 0 {
                Text("无监测记录")
            } else {
                VStack(alignment: .leading, spacing: 10) {
                    HStack{
                        Text("检测记录")
                        Spacer()
                    }
                    
                    ForEach(vm.currentPerson.recordList, id: \.self) { record in
                        HStack{
                            Text(record.date ?? "-")
                                .foregroundColor(record.isActive ? Color.red : Color.green)
                            Spacer()
                            Text(record.isActive ? "阳性":"阴性")
                                .foregroundColor(record.isActive ? Color.red : Color.green)
                                .bold()
                        }
                    }
                    
                    Divider()
                        .padding(.vertical)
                }
                
                Button {
                    vm.resetInfo()
                } label: {
                    Text("重制")
                        .font(.footnote)
                }
                .padding()
            }
            
            
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
