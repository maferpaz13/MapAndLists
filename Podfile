# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MapAndLists' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MapAndLists
   pod 'Alamofire'
   pod 'NotificationBannerSwift', '~> 3.0.0'
   pod 'lottie-ios'
   pod 'GoogleMaps', '~> 3.7.0'
   pod 'iOSDropDown', :path => 'apis/iOSDropDown-master'
   pod 'SDWebImage', '~> 5.0'
   pod 'SideMenu'
   pod 'Charts', '3.6.0'
   pod 'DatePickerDialog'
   pod 'Eureka'
   pod 'Firebase'
     pod 'Firebase/Auth'
     pod 'Firebase/Core'
     pod 'Firebase/Database'
     pod 'Firebase/Storage'
     pod 'Firebase/Messaging'
     pod 'Firebase/Crashlytics'
     pod 'Firebase/Analytics'
     pod 'SwiftyJSON'
     
    post_install do |installer_representation|
           installer_representation.pods_project.targets.each do |target|
               target.build_configurations.each do |config|
                   config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
                   config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
               end
               
           end

       end
     

end