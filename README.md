Testing RubyMotion Namespaces in Objective C
============================================

This is an experimental RubyMotion project that demonstrates how classes
defined inside Ruby namespaces end work when accessed from Objective C. To test
this, I defined three classes all named `SomeClass`. The first is defined in
`Test.m` as an Objective C class. The second is defined in
`app/app_delegate.rb` as `Hidden::SomeClass` and the third as
`Hidden::Deeper::SomeClass`.

When you build and run the application, you'll see this output:

    Testing what Ruby namespaces look like
    NSStringFromClass(SomeClass) => SomeClass
    NSStringFromClass(Hidden::SomeClass) => RBSomeClass
    NSStringFromClass(Hidden::Deeper::SomeClass) => RBSomeClass2

    namespace-test[42431:c07] Accessing classes and calling them from Objective C
    namespace-test[42431:c07] Getting class from string SomeClass
    namespace-test[42431:c07] sent message to SomeClass
    namespace-test[42431:c07] Getting class from string RBSomeClass
    namespace-test[42431:c07] sent message to Hidden::SomeClass
    namespace-test[42431:c07] Getting class from string RBSomeClass2
    namespace-test[42431:c07] sent message to Hidden::Deeper::SomeClass

Here's what I deduce from these results:

  - Namespaced Ruby classes do not clash with Objective C classes of the same
    name.
  - The actual Objective C class name of a namespaced class starts with "RB".
  - If there is more than one namespaced class with the same name, it gets an
    incrementing integer tacked on to the end.

