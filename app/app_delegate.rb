module Hidden
  class SomeClass
    def self.callMe
      NSLog "sent message to #{self}"
    end
  end

  module Deeper
    class SomeClass
      def self.callMe
        NSLog "sent message to #{self}"
      end
    end
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    puts
    puts "Testing what Ruby namespaces look like"
    puts "NSStringFromClass(#{SomeClass}) " +
      "=> #{NSStringFromClass(SomeClass)}"
    puts "NSStringFromClass(#{Hidden::SomeClass}) " +
      "=> #{NSStringFromClass(Hidden::SomeClass)}"
    puts "NSStringFromClass(#{Hidden::Deeper::SomeClass}) " +
      "=> #{NSStringFromClass(Hidden::Deeper::SomeClass)}"

    puts

    TestOutput.whatDoesItLookLikeFromObjectiveC
    exit
  end
end
