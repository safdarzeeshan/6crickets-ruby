# Description: This file contains the implementation of the sufficient_hardware_cameras? method.

# Example usage
# hw_camera_distance_ranges = [[1, 5], [6, 10], [10, 15]]
# hw_camera_light_ranges = [[100, 150], [150, 200], [50, 100]]
# sw_camera_desired_distance_range = [1, 11]
# sw_camera_desired_light_range = [100, 200]


# sufficient_hardware_cameras?(hw_camera_distance_ranges, hw_camera_light_ranges, 
# sw_camera_desired_light_range, sw_camera_desired_distance_range)

class CameraSupport
  public

  def sufficient_hardware_cameras?(hw_camera_distance_ranges, hw_camera_light_ranges, 
    sw_camera_desired_distance_range, sw_camera_desired_light_range)

    merged_distance_ranges = merge_ranges(hw_camera_distance_ranges)
    merged_light_ranges = merge_ranges(hw_camera_light_ranges)

    distance_fully_covered = ranges_fully_covered?(merged_distance_ranges, sw_camera_desired_distance_range)
    light_fully_covered = ranges_fully_covered?(merged_light_ranges, sw_camera_desired_light_range)

    distance_fully_covered && light_fully_covered
  end

  private

  # Merges overlapping ranges and organizes them in ascending order. This method also takes into account 
  # ranges that are non-contiguous.
  def merge_ranges(ranges)
    sorted_ranges = ranges.sort_by(&:first)
    sorted_ranges.reduce([]) do |merged, current|
      if merged.empty? || merged.last.last < current.first
        merged << current
      else
        merged.last[1] = [merged.last.last, current.last].max
      end
      merged
    end
  end

  def ranges_fully_covered?(merged_ranges, desired_range)
    current_position = desired_range.first

    merged_ranges.each do |range|
      # 1. This makes sure the lower bound of the desired range is greater than the hw camera's lowest range
      # 2. If there's a gap between the current position and the start of the range. In this case, 
      # the desired range is not fully covered.
      if range.first > current_position
        return false
      end

      # Move the current position to the end of the current range + 1
      current_position = range.last + 1

      # If the current position exceeds the desired range's end, it's fully covered
      if current_position > desired_range.last
        return true
      end
    end

    # If we finish the loop without covering the desired range, return false
    false
  end
end
