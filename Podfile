
platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

def common_static
    pod 'SnapKit', '= 4.0.1' #AutoLayout
    pod 'PGSwiftExtensions', :git => 'git@github.com:PrettyGrass/PGSwiftExtensions.git', :branch => '1.0.0'
end

def common
    ios_comp = 'git@g.dou-pai.com:ios_component/'
    pod 'LLTableViewAdapter',                       :git => ios_comp+'LLTableViewAdapter.git', :branch => '1.2.0'
    pod 'RTRootNavigationController',               :git => 'git@g.dou-pai.com:ios_component/RTRootNavigationController.git', :branch => '0.7.0'
    
    #pod 'DTConfigModules',               :git => ios_comp+'DTConfigModules.git', :branch => '1.0.0'
end

target 'SwiftProject' do
    common
    common_static
end

