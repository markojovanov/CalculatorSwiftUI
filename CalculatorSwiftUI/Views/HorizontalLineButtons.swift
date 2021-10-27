import SwiftUI
import Combine

struct HorizontalLineButtons: View {
    
    @ObservedObject var viewModel: CalculateLogic
    
    var buttonsArray: [String]
    var lastLine: Bool?
    var firstLine: Bool?
    
    var body: some View {
        if lastLine == true {
            HStack(spacing: 1) {
                ButtonView(viewModel: viewModel,buttonColor: .secondary, buttonName: buttonsArray[0])
                HStack(spacing: 1) {
                    ButtonView(viewModel: viewModel,buttonColor: .secondary, buttonName: buttonsArray[1])
                    ButtonView(viewModel: viewModel, buttonName: buttonsArray[2])
                }
            }
        } else if firstLine == true {
            HStack(spacing: 1) {
                ForEach(buttonsArray, id: \.self) { button in
                    ButtonView(viewModel: viewModel, buttonName: button)
                }
            }
        } else {
            HStack(spacing: 1) {
                ForEach(buttonsArray, id: \.self) { button in
                    if button == buttonsArray.last {
                        ButtonView(viewModel: viewModel, buttonName: button)
                    } else {
                        ButtonView(viewModel: viewModel,buttonColor: .secondary, buttonName: button)
                    }
                }
            }
        }
    }
}
