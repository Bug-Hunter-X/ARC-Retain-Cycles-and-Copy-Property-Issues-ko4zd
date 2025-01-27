This repository demonstrates two common but subtle Objective-C bugs related to Automatic Reference Counting (ARC):

1. **Retain Cycles within Blocks:** A strong reference cycle is created when a block captures 'self', and the object referenced in the block also holds a strong reference to 'self'.  This prevents proper deallocation, causing memory leaks.

2. **Improper Use of 'copy' with Properties:** Incorrect use of the 'copy' attribute with mutable objects might lead to unexpected behavior. The example focuses on NSString but the principle applies to other mutable objects.

The 'bug.m' file demonstrates the issues, while 'bugSolution.m' provides the corrected code with explanations.