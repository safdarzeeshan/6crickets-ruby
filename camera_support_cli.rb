require_relative 'camera_support'

# Helper method to parse ranges from command-line arguments
def parse_ranges(arg)
  arg.split(';').map { |range| range.split(',').map(&:to_i) }
end

if ARGV.length != 4
  puts "Usage: ruby camera_support.rb <hw_camera_distance_ranges> <hw_camera_light_ranges> <sw_camera_desired_distance_range> <sw_camera_desired_light_range>"
  puts "Example: ruby camera_support.rb \"1,5;6,10;12,15\" \"100,150;150,200;50,100\" \"1,11\" \"100,200\""
  exit 1
end

# Parse command-line arguments
hw_camera_distance_ranges = parse_ranges(ARGV[0])
hw_camera_light_ranges = parse_ranges(ARGV[1])
sw_camera_desired_distance_range = ARGV[2].split(',').map(&:to_i)
sw_camera_desired_light_range = ARGV[3].split(',').map(&:to_i)

# Create an instance of the CameraSupport class
camera_support = CameraSupport.new

# Call the method and print the result
result = camera_support.sufficient_hardware_cameras?(hw_camera_distance_ranges, hw_camera_light_ranges, 
sw_camera_desired_distance_range, sw_camera_desired_light_range)

puts "Is the hardware sufficient? #{result}"