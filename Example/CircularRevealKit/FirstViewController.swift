//
// Copyright (c) 2017 T-Pro
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without restriction,
// including without limitation the rights to use, copy, modify, merge,
// publish, distribute, sublicense, and/or sell copies of the Software,
// and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit
import CircularRevealKit

class FirstViewController: UIViewController {
  
  var viewReady = false

  lazy var randomButton: UIButton = {
    let view = UIButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle("Click me", for: UIControlState.normal)
    view.backgroundColor = UIColor.black
    return view
  }()
  
  override func loadView() {
    super.loadView()
    title = "FirstViewController"
    setupBackButton()
    view.backgroundColor = UIColor.white
    view.addSubview(randomButton)
    view.updateConstraintsIfNeeded()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    randomButton.addTarget(self, action: #selector(randomButtonClick), for: .touchUpInside)
  }
  
  override func updateViewConstraints() {
    if !viewReady {
      viewReady = true
      view.addConstraint(
        NSLayoutConstraint(
          item: view,
          attribute: .centerX,
          relatedBy: .equal,
          toItem: randomButton,
          attribute: .centerX,
          multiplier: 1,
          constant: 0))
      view.addConstraint(
        NSLayoutConstraint(
          item: view,
          attribute: .centerY,
          relatedBy: .equal,
          toItem: randomButton,
          attribute: .centerY,
          multiplier: 1,
          constant: 0))
    }
    super.updateViewConstraints()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @objc private func randomButtonClick() {
    self.navigationController?.radialPushViewController(SecondViewController())
  }
  
}

