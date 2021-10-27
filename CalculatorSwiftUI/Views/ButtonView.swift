import SwiftUI
import Combine

struct ButtonView: View {
    
    @ObservedObject var viewModel: CalculateLogic
    
    var buttonColor: Color = .orange
    var buttonName: String
    
    var body: some View {
        Button(action: {
            if Int(buttonName) != nil {
                viewModel.numButtonPressed(buttonName: buttonName)
            } else {
                viewModel.calcButtonPressed(buttonName: buttonName)
            }
        }, label: {
            Text(buttonName)
                .frame(maxWidth: .infinity)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .frame(maxHeight: .infinity)
        })
        .background(buttonColor)
        .border(Color.black)
    }
}

