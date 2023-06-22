//
//  ViewController.swift
//  ChartsDemoIOS
//
//  Created by Thanh Dat on 14/06/2023.
//

import UIKit

class ViewController: UIViewController  {
    var chartDataSourse: [ChartData] = []
    var chartView: UIView = UIView(frame: CGRect (x: 0, y: 0, width: 0, height: 0))

    override func viewDidLoad() {
        super.viewDidLoad()
//    B1: Khởi tạo data
        initChartData()
//    B2: Tạo 1 biểu đồ ChartView
        chartView = UIView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 200))
        chartView.backgroundColor = .lightGray
//    B3: Add chartView vào View Cha
        self.view.addSubview(chartView)
//    B4: vẽ Biểu đồ
        drawChart()
    }
//    Hàm vẽ biểu đồ
    func drawChart() {
        for (i, currentData) in chartDataSourse.enumerated() {
            let currentX = 15 + (i * 30)
            let currentHeight = (currentData.value/maxValueInChart()) * (chartView.frame.height * 0.9)
            let currentY = chartView.frame.height - currentHeight
            let currentColumn = UIView(frame: CGRect(x: Double(currentX), y: currentY, width: 25, height: currentHeight))
            currentColumn.backgroundColor = currentData.color
            chartView.addSubview(currentColumn)
        }
    }
    
    func maxValueInChart() -> Double {
        var maxValue = chartDataSourse[0].value
        for data in chartDataSourse {
            if data.value > maxValue {
                maxValue = data.value
            }
        }
        return maxValue
    }
    func initChartData() {
        let thang1 = ChartData(type: "Thang 1", value: 12000, color: .red)
        let thang2 = ChartData(type: "Thang 2", value: 20000, color: .green)
        let thang3 = ChartData(type: "Thang 3", value: 15000, color: .yellow)
        let thang4 = ChartData(type: "Thang 4", value: 19000, color: .orange)
        let thang5 = ChartData(type: "Thang 5", value: 7000, color: .systemPink)
        let thang6 = ChartData(type: "Thang 6", value: 5000, color: .blue)
    
        chartDataSourse.append(thang1)
        chartDataSourse.append(thang2)
        chartDataSourse.append(thang3)
        chartDataSourse.append(thang4)
        chartDataSourse.append(thang5)
        chartDataSourse.append(thang6)
    }
}

