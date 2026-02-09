Pod::Spec.new do |m|

  version = '0.40.1'

  m.name    = 'AccuTerraSDKCore'
  m.version = version

  m.summary           = 'AccuTerra iOS SDK Core.'
  m.description       = 'AccuTerra iOS SDK Core'
  m.homepage          = 'http://www.accuterra.com/'
  m.author            = { 'NeoTreks' => 'info@neotreks.com' }
  m.documentation_url = 'http://www.accuterra.com/'
  m.license           = { :type => 'Commercial', :text => 'BY DOWNLOADING THE ACCUTERRA SDK Core FRAMEWORK, YOU ARE AGREEING TO THE TERMS AND CONDITIONS OF THE ACCUTERRA SDK LICENSE AGREEMENT LOCATED AT https://sdk.accuterra.com.  IF YOU DO NOT AGREE TO THE TERMS AND CONDITIONS OF THE ACCUTERRA SDK LICENSE AGREEMENT, YOU ARE NOT AUTHORIZED TO AND YOU MAY NOT DOWNLOAD THE ACCUTERRA SDK FRAMEWORK.' }

  m.source = {
    :http => "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk-core/#{version}/AccuTerraSDKCore.zip"
  }

  m.platform              = :ios
  m.ios.deployment_target = '14.0'

  m.dependency 'ReachabilitySwift', '5.2.4'
  m.dependency 'Turf', '4.0.0'
  
  m.requires_arc = true

  m.vendored_frameworks = 'AccuTerraSDKCore.xcframework'
  m.module_name = 'AccuTerraSDKCore'

  m.preserve_path = '**/*.bcsymbolmap'

end