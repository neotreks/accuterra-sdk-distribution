Pod::Spec.new do |m|

  version = '0.40.1'

  m.name    = 'AccuTerraSDK'
  m.version = version

  m.summary           = 'AccuTerra iOS SDK.'
  m.description       = 'AccuTerra iOS SDK with map and trails features.'
  m.homepage          = 'http://www.accuterra.com/'
  m.author            = { 'NeoTreks' => 'info@neotreks.com' }
  m.documentation_url = 'http://www.accuterra.com/'
  m.license           = { :type => 'Commercial', :text => 'BY DOWNLOADING THE ACCUTERRA SDK FRAMEWORK, YOU ARE AGREEING TO THE TERMS AND CONDITIONS OF THE ACCUTERRA SDK LICENSE AGREEMENT LOCATED AT https://sdk.accuterra.com.  IF YOU DO NOT AGREE TO THE TERMS AND CONDITIONS OF THE ACCUTERRA SDK LICENSE AGREEMENT, YOU ARE NOT AUTHORIZED TO AND YOU MAY NOT DOWNLOAD THE ACCUTERRA SDK FRAMEWORK.' }

  m.source = {
    :http => "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk/#{version}/AccuTerraSDK-CocoaPods.zip"
  }

  m.platform              = :ios
  m.ios.deployment_target = '14.0'

  m.dependency 'AccuTerraSDKCore', "#{version}"
  m.dependency 'AccuTerra-MapLibre-iOS-SDK', '6.18.2'
  
  m.requires_arc = true

  m.vendored_frameworks = 'AccuTerraSDK.xcframework'
  m.module_name = 'AccuTerraSDK'
  m.resources = 'AccuTerraSDK_AccuTerraSDK.bundle'

  m.preserve_path = '**/*.bcsymbolmap'

end