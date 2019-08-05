# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

def testing_pods
  
  # A bdd framework for Swift and Objective-C
  pod 'Quick'
  # A matcher framework for your tests.
  pod 'Nimble'
  
end

target 'ShowCase' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Swift style and conventions
  pod 'SwiftLint'
  # Pods for ShowCase

  target 'ShowCaseTests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

  target 'ShowCaseUITests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

end
