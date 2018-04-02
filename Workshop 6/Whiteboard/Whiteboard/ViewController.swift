//
//  ViewController.swift
//  Whiteboard
//
//  Created by Matthew Ruston on 3/26/18.
//  Copyright © 2018 MattRuston. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let canvasView = CanvasView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let undoButton = UIButton()
        undoButton.setTitle("Undo", for: .normal)
        undoButton.addTarget(self, action: #selector(undo), for: .touchUpInside)
        undoButton.setTitleColor(.black, for: .normal)
        undoButton.translatesAutoresizingMaskIntoConstraints = false
        
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.backgroundColor = .white

        view.addSubview(canvasView)
        view.addSubview(undoButton)

        NSLayoutConstraint.activate([
            canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            canvasView.topAnchor.constraint(equalTo: view.topAnchor),
            canvasView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            undoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            undoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    @objc func undo() {
        canvasView.undo()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let point = touch.location(in: canvasView)
        canvasView.startPath(at: point)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let point = touch.location(in: canvasView)
        canvasView.add(point: point)
    }

}

class CanvasView: UIView {
    
    private var paths = [[CGPoint]]()
    
    func undo() {
        guard paths.count > 0 else {
            return
        }
        
        paths.removeLast()
        setNeedsDisplay()
    }
    
    func add(point: CGPoint) {
        guard paths.count - 1 > 0 else {
            return
        }
        
        paths[paths.count - 1].append(point)
        setNeedsDisplay()
    }
    
    func startPath(at point: CGPoint) {
        paths.append([point])
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        for path in paths {
            guard let start = path.first else {
                continue
            }
            
            let bezierPath = UIBezierPath()
            
            bezierPath.move(to: start)
            
            for point in path {
                bezierPath.addLine(to: point)
            }
            
            UIColor.black.set()
            bezierPath.lineWidth = 2
            
            bezierPath.stroke()
        }
    }
}

























