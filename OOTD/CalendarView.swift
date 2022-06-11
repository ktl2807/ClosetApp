//
//  CalendarView.swift
//  OOTD
//
//  Created by sand liao on 08/06/2022.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack{
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
