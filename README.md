# Framework Creation And Distribution

Let's discuss about how to create a framework and distribute the framwork 
so that you can import it and use it in other projects.

BASIC CONCEPTS :

The act of linking libraries is a form of code dependency management. When any app is run, its executable code is loaded into memory. Additionally, any code libraries that it depends on are also loaded into memory. 

There are two type of linking: static, and dynamic. Both offer different benefits to the developer and should be used according to these benefits.

Statically linked Library/framework  : 

Unlike dynamic, linking static libraries includes the object file code from the library into the target's binary. This results in a larger size on disk and slower launch times. Because the library's code is added directly to the linked target's binary, it means that to update any code in the library, the linked target would also have to be rebuilt.

Dynamically linked framework : 

Dynamic linking is most commonly used on OS X and iOS. When dynamic libraries are linked, none of the library's code is included directly into the linked target. Instead, the libraries are loaded into memory at runtime prior to having symbols getting resolved. Because the code isn't statically linked into the executable binary, there are some benefits from loading at runtime.

At runtime, only a single copy of the library code is shared among all processes who are using it. Thus ii’s reducing the memory usages and improves the performances.

---------------------------------------------------------------------

BUILDING FRAMEWORK :-

You need a way to package a static library and it's header into a single component which you can add in your project and use it immediately.

What is a framework ?

A framework is a collection of resources . It collects a static library and it’s header files into a single structure that Xcode can easily incorporate into your projects.

----------------------------------------------------------------------
******* Creating a static library ***** 
----------------------------------------------------------------------

A static library projects consists of 2 files : (1) Header file , (2) Implementation file . Lets say : “MathOpeartionsLibrary” project name.

It creates (1) MathOpeartionsLibrary.h and (2) MathOpeartionsLibrary.m . 
Let's we are adding the following in "MathOpeartionsLibrary.h" :

#import <UIKit/UIKit.h>

This is adding umbrella header of “UIKit” , but Xcode static library project does not link against it by default. So add “UIKit” as a dependency. 

Select Project —> Choose Target —> Build Phases —> Link Binary with libraries —> Search (UIKit) —> Add 

----------------------------------------------------------------------
ADD A NEW PHASE IN THE BUILD : 
----------------------------------------------------------------------

Phase will collect the public header files and put them somewhere accessible to the compiler.  Later you will copy these into the framework.

Select Project —> Targets —> Editor —> Add build phase —> Add Copy Headers Build Phase 

Headers consists of  3 sections : (1) Public (2) Private (3) Project

Drag the “MathOpeartionsLibrary.h” file into “public” section. 







