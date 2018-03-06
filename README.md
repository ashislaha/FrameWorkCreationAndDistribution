# Framework Creation And Distribution

Let's discuss about how to create a framework and distribute the framwork 
so that you can import it and use it in other projects.

### BASIC CONCEPTS :

The act of linking libraries is a form of code dependency management. When any app is run, its executable code is loaded into memory. Additionally, any code libraries that it depends on are also loaded into memory. 

There are two type of linking: static, and dynamic. Both offer different benefits to the developer and should be used according to these benefits.

### Statically linked Library/framework  : 

Unlike dynamic, linking static libraries includes the object file code from the library into the target's binary. This results in a larger size on disk and slower launch times. Because the library's code is added directly to the linked target's binary, it means that to update any code in the library, the linked target would also have to be rebuilt.

### Dynamically linked framework : 

Dynamic linking is most commonly used on OS X and iOS. When dynamic libraries are linked, none of the library's code is included directly into the linked target. Instead, the libraries are loaded into memory at runtime prior to having symbols getting resolved. Because the code isn't statically linked into the executable binary, there are some benefits from loading at runtime.

At runtime, only a single copy of the library code is shared among all processes who are using it. Thus ii’s reducing the memory usages and improves the performances.

### BUILDING FRAMEWORK :-

You need a way to package a static library and it's header into a single component which you can add in your project and use it immediately.

## What is a framework ?

A framework is modular and reusable set of code that is used as a building blocks of high level piece of software. 

<b> The best reason to use framework: Build once and use infinite number of times. </b>

## Let's create a FrameWork:

Just for sake of simplicity I am creating a simple UIView component inside a framework (ALModalStatus) and using in another project (TestFramework).

The "ALModalStatusView" consists of Image, Title and Description.

### STEP 1: Create a Cocoa Touch Framework: 

let's name it "ALModalStatus".

<img width="512" alt="screen shot 2018-03-05 at 9 21 11 pm" src="https://user-images.githubusercontent.com/10649284/36985401-2ffb7218-20bd-11e8-852c-26ff6f25310f.png">

### STEP 2: Change the build configuration to release mode of your framework

Product --> Scheme --> Edit Scheme --> Build configuration --> (move from debug to release)

<img width="640" alt="screen shot 2018-03-06 at 8 27 04 am" src="https://user-images.githubusercontent.com/10649284/37012069-c8c138ba-2118-11e8-9a08-5f1f0d698ce2.png">

### STEP 3: Create ALModalStatusView with XIB:

    import UIKit
    public class ALModalStatusView: UIView {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private let nibName = "ALModalStatusView"
    var contentView: UIView!
    
    // MARK: Set up views
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        
        contentView.center = center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        titleLabel.text = ""
        descriptionLabel.text = ""
    }
    
    // Allow view to control itself
    public override func layoutSubviews() {
        // Rounded corners
        layoutIfNeeded()
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
    }
    
    // MARK: update UI
    public func set(image: UIImage) {
        imageView.image = image
    }
    
    public func set(title: String) {
        titleLabel.text = title
    }
    
    public func set(description: String) {
        descriptionLabel.text = description
    }
}

build the project.

### STEP 4: Create a test Project to use ALModalStatusView.

create a "TestFramework" project.

### STEP 5: Add framework in the test project.

<b> Project Inspector --> General --> Embedded Binaries --> click on + button --> Click on "Add other" --> Choose "ALModalStatus.xcodeproj"

Click on "+" button again in Embedded Binaries, you will get options for "ALModalStatus" framework. Add it.
Now you can use this framework. 

<img width="456" alt="screen shot 2018-03-06 at 8 36 44 am" src="https://user-images.githubusercontent.com/10649284/37012217-a76a8882-2119-11e8-80c1-ee717a27da5f.png">

For ease of use, You can copy the "ALModalStatus.framework" to some other place like Desktop/Documents and use it instead of adding the entire "ALModalStatus.xcodeproj" file.
</b>

### After adding the framework: 

<img width="640" alt="screen shot 2018-03-06 at 8 45 28 am" src="https://user-images.githubusercontent.com/10649284/37012468-d32f80ca-211a-11e8-90df-d320f2eb502c.png">

### STEP 6: Use of ALModalStatus framework in test project:

    import UIKit
    import ALModalStatus

    class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }

    @IBAction func showStatusViewTapped(_ sender: UIButton) {
        
        let modalView = ALModalStatusView(frame: view.bounds)
        modalView.set(image: #imageLiteral(resourceName: "select"))
        modalView.set(title: "Hi I am Header")
        modalView.set(description: "Provide some description")
        view.addSubview(modalView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            modalView.removeFromSuperview()
        }
      }
    }

### 7: Output: 

![simulator screen shot - iphone 8 plus - 2018-03-05 at 21 10 11](https://user-images.githubusercontent.com/10649284/36985404-3056d842-20bd-11e8-94e3-0e8366de86e7.png)


![simulator screen shot - iphone 8 plus - 2018-03-05 at 21 10 14](https://user-images.githubusercontent.com/10649284/36985407-31ab14ce-20bd-11e8-8cd7-40c3ecc53adb.png)

## What's next? Framework distribution using CocoaPods:







