
platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

def common_static
    pod 'SnapKit', '= 4.0.0' #AutoLayout

end

def common
    ios_comp = 'git@g.dou-pai.com:ios_component/'
    pod 'LLTableViewAdapter',                       :git => ios_comp+'LLTableViewAdapter.git', :branch => '1.2.0'
end

target 'SwiftProject' do
    common
    common_static
end

