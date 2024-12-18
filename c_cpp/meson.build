project(
  'PROJECT_NAME',
  'cpp',
  version: '0.1',
  default_options: ['warning_level=3', 'cpp_std=gnu++26'],
)

incd = include_directories('include')
src = files('src/main.cpp')

exe = executable(
  'PROJECT_NAME',
  src,
  include_directories: incd,
  install: true,
)