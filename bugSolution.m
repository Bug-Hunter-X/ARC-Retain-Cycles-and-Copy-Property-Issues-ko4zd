The solution involves using `__weak` to break the retain cycle within blocks:

```objectivec
@property (nonatomic, strong) MyObject *myObject;

// ... later in your code ...
__weak typeof(self) weakSelf = self; // Create a weak reference to self
[self.myObject doSomethingWithCompletion:^(NSError *error) {
    if (error) {
        // Handle error
    } else {
        // Now using weakSelf safely.
        if (weakSelf) { // Check for nil in case self has been deallocated
            [weakSelf performSelector:@selector(someMethod) withObject:nil afterDelay:1];
        }
    }
}];
```

For the 'copy' issue, ensure correct usage.  If you need to ensure immutability use `copy`. If the string is truly immutable, then copy is not necessary and strong is adequate, or if you are happy to modify the original string use strong.  Copying a mutable object will still be mutable, but a copy.

```objectivec
@property (nonatomic, copy) NSString *someString;
// ... later...
self.someString = [self.someString stringByAppendingString:@", added text"]; // This creates a new string, no issue
self.someString = [NSMutableString stringWithString: @"Hello"]; // This creates a new mutable string, no issue

@property (nonatomic, strong) NSString *someString2;
// ...later...
self.someString2 = @"Hello"; // This works, no issue
self.someString2 = [self.someString2 stringByAppendingString:@", added text"]; // This creates a new immutable string, no issue
```