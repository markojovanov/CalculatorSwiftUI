import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var viewModel: CalculateLogic
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            HStack(alignment: .bottom) {
                Text(viewModel.displayLabel)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(maxHeight: .infinity,alignment: .bottom)
            HorizontalLineButtons(viewModel: viewModel,
                                  buttonsArray: ["AC","+/-","%","/"],
                                  firstLine: true)
            HorizontalLineButtons(viewModel: viewModel,
                                  buttonsArray: ["7","8","9","*"])
            HorizontalLineButtons(viewModel: viewModel,
                                  buttonsArray: ["4","5","6","-"])
            HorizontalLineButtons(viewModel: viewModel,
                                  buttonsArray: ["1","2","3","+"])
            HorizontalLineButtons(viewModel: viewModel,
                                  buttonsArray: ["0",".","="],
                                  lastLine: true)
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CalculateLogic())
    }
}
