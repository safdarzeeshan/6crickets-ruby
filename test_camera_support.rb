# test_camera_support.rb

require 'minitest/autorun'
require_relative 'camera_support'

class CameraSupportTest < Minitest::Test
	def setup
		@camera_support = CameraSupport.new
	end

	def test_sufficient_hardware_cameras
		hw_camera_distance_ranges = [[1, 5], [6, 10], [10, 15]]
		hw_camera_light_ranges = [[100, 150], [150, 200], [50, 100]]
		sw_camera_desired_distance_range = [1, 11]
		sw_camera_desired_light_range = [100, 200]

		result = @camera_support.sufficient_hardware_cameras?(hw_camera_distance_ranges, hw_camera_light_ranges, sw_camera_desired_distance_range, sw_camera_desired_light_range)
		assert_equal true, result
	end

	def test_insufficient_hardware_cameras_distance
		hw_camera_distance_ranges = [[1, 5], [6, 9]]
		hw_camera_light_ranges = [[100, 150], [150, 200], [50, 100]]
		sw_camera_desired_distance_range = [1, 11]
		sw_camera_desired_light_range = [100, 200]

		result = @camera_support.sufficient_hardware_cameras?(hw_camera_distance_ranges, hw_camera_light_ranges, sw_camera_desired_distance_range, sw_camera_desired_light_range)
		assert_equal false, result
	end

	def test_insufficient_hardware_cameras_light
		hw_camera_distance_ranges = [[1, 5], [6, 10], [10, 15]]
		hw_camera_light_ranges = [[100, 150], [150, 180]]
		sw_camera_desired_distance_range = [1, 11]
		sw_camera_desired_light_range = [100, 200]

		result = @camera_support.sufficient_hardware_cameras?(hw_camera_distance_ranges, hw_camera_light_ranges, sw_camera_desired_distance_range, sw_camera_desired_light_range)
		assert_equal false, result
	end

	def test_merge_ranges
		ranges = [[1, 5], [6, 10], [10, 15]]
		expected = [[1, 5], [6, 15]]
		result = @camera_support.send(:merge_ranges, ranges)
		assert_equal expected, result
	end

	def test_ranges_fully_covered
		merged_ranges = [[1, 5], [6, 15]]
		desired_range = [1, 11]
		result = @camera_support.send(:ranges_fully_covered?, merged_ranges, desired_range)
		assert_equal true, result
	end

	def test_ranges_not_fully_covered
		merged_ranges = [[1, 5], [7, 15]]
		desired_range = [1, 11]
		result = @camera_support.send(:ranges_fully_covered?, merged_ranges, desired_range)
		assert_equal false, result
	end
end