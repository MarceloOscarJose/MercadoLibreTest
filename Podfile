source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
inhibit_all_warnings!
use_frameworks!

target 'MercadoLibre' do

    pod 'Alamofire', '~> 4.2.0'
    pod 'AlamofireImage', '~> 3.1'
    pod 'SwiftyJSON', '~> 3.0'
    pod 'NVActivityIndicatorView', '~> 3.1'
    pod 'ImageSlideshow', '~> 1.0.0'
    pod 'PureLayout', '~> 3.0.2'
    
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
