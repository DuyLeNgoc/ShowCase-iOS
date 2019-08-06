# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

def testing_pods
  
  # A bdd framework for Swift and Objective-C
  pod 'Quick'
  # A matcher framework for your tests.
  pod 'Nimble'
  # Reactive Programming
  pod 'RxBlocking', '~> 5'
  pod 'RxTest', '~> 5'
  # Nimble extensions making unit testing with RxSwift easier
  pod 'RxNimble', :git => 'git@github.com:RxSwiftCommunity/RxNimble.git', :branch => 'master'
end

target 'ShowCase' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for ShowCase
  # Swift style and conventions
  pod 'SwiftLint'
  # Reactive Programming in Swift
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  # A collection of Rx operators & tools not found in the core RxSwift distribution
  pod 'RxSwiftExt', '~> 5'
  # UITableView and UICollectionView Data Sources for RxSwift
  pod 'RxDataSources', '~> 4.0'
  # RxSwift wrapper around the elegant HTTP networking in Swift Alamofire
  pod 'RxAlamofire'
  # RxSwift bindings for Reachability
  pod 'RxReachability', '~> 1.0.0'
  # Localize your app use RxSwift
  pod 'RxLocalizer'

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
