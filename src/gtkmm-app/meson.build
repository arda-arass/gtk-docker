project('gtkmm-app', 'cpp', default_options: ['cpp_std=c++17'])

# Define sources
sources = [
  'main.cpp',
  'window.cpp',
]

# Define dependencies
dependencies = [
  dependency('gtkmm-4.0'),
  # Add any other dependencies your application requires
]

# Create executable
executable('gtkmm-app', sources, dependencies : dependencies, install : true)
