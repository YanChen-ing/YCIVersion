Pod::Spec.new do |s|
  s.name             = 'YCIVersion'
  s.version          = '0.1.0'
  s.summary          = '用于需要进行版本管理组件或项目'

  s.description      = <<-DESC
  支持组件或项目：
  1.链式版本迁移操作管理，灵活添加，移除，修改版本操作
  2.可用于引导弹窗，一次性操作等
  3.支持某版本操作，每次升级版本都执行
                       DESC

  s.homepage         = 'https://github.com/YanChen-ing/YCIVersion'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yanchen' => 'workforyc@163.com' }
  s.source           = { :git => 'https://github.com/YanChen-ing/YCIVersion.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  
  s.swift_version = "4.2"
  s.swift_versions = ['4.0', '4.2', '5.0']

  s.source_files = 'YCIVersion/Classes/**/*'

end
