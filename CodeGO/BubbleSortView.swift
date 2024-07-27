import SwiftUI

struct BubbleSortView: View {
    
    @State private var numbers = [5, 3, 1, 4, 2, 7, 6]
    @State private var isSorting = false
    
    var body: some View {
        VStack {
            HStack {
                ForEach(numbers, id: \.self) { number in
                    Text("\(number)")
                        .padding()
                        .background(self.color(for: number))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            HStack {
                Button(action: {
                    self.isSorting = true
                    self.bubbleSort()
                }) {
                    Image(systemName: "play.fill")
                        .padding()
                        .background(isSorting ? Color.gray : Color.green)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                .disabled(isSorting)
                
                Button(action: {
                }) {
                    Image(systemName: "pause.fill")
                        .padding()
                        .background(isSorting ? Color.gray : Color.yellow)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    self.shuffleNumbers()
                }) {
                    Image(systemName: "shuffle")
                        .padding()
                        .background(isSorting ? Color.gray : Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                .disabled(isSorting)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.2))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
    }
    
    private func color(for number: Int) -> Color {
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink]
        return colors[number % colors.count]
    }
    
    private func bubbleSort() {
        DispatchQueue.global(qos: .userInitiated).async {
            for i in 0..<self.numbers.count {
                for j in 0..<self.numbers.count - i - 1 {
                    if self.numbers[j] > self.numbers[j + 1] {
                        DispatchQueue.main.async {
                            withAnimation {
                                self.numbers.swapAt(j, j + 1)
                            }
                        }
                        Thread.sleep(forTimeInterval: 0.5)
                    }
                }
            }
            DispatchQueue.main.async {
                self.isSorting = false
            }
        }
    }
    
    private func shuffleNumbers() {
        numbers.shuffle()
        print(numbers)
    }
}

#Preview {
    BubbleSortView()
}
