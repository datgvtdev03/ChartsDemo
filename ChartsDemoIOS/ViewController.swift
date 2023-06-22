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
        drawChartLabels()
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
    
    func drawChartLabels(){
        for (i, currentData) in chartDataSourse.enumerated() {
            let labelX = 15 + (i * 30)
            let labelY = chartView.frame.height
            
            let valueX = UILabel(frame: CGRect(x: labelX , y: Int(labelY), width: 25, height: 20))
            valueX.text = currentData.type
            valueX.textAlignment = .center
            valueX.font = UIFont.systemFont(ofSize: 10)
            valueX.textColor = .black
            chartView.addSubview(valueX)
            
        }
    }
    func initChartData() {
        let thang1 = ChartData(type: "T1", value: 12000, color: .red)
        let thang2 = ChartData(type: "T2", value: 20000, color: .green)
        let thang3 = ChartData(type: "T3", value: 15000, color: .yellow)
        let thang4 = ChartData(type: "T4", value: 19000, color: .orange)
        let thang5 = ChartData(type: "T5", value: 7000, color: .systemPink)
        let thang6 = ChartData(type: "T6", value: 5000, color: .blue)
    
        chartDataSourse.append(thang1)
        chartDataSourse.append(thang2)
        chartDataSourse.append(thang3)
        chartDataSourse.append(thang4)
        chartDataSourse.append(thang5)
        chartDataSourse.append(thang6)
    }
}

