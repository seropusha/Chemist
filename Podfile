# Uncomment the next line to define a global platform for your project
# platform :ios, '10.0'

workspace 'Chemist'

platform :ios, '10.0'
inhibit_all_warnings!
use_frameworks!

def for_all
    pod 'ReactiveSwift', '~> 3.0'
    pod 'ReactiveCocoa', '~> 7.0'
end

target 'Chemist' do
    for_all
    project 'Chemist/Chemist.xcodeproj'
end

target 'Chemist-platform' do
    for_all
    project 'Chemist-platform/Chemist-platform.xcodeproj'
end

target 'Chemist-domain' do
    for_all
    project 'Chemist-domain/Chemist-domain.xcodeproj'
end


