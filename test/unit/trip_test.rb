require 'test_helper'

class TripTest < ActiveSupport::TestCase
	test "that a status requires content" do 
		trip = Trip.new
		assert !trip.save
		assert !trip.error[:content].empty?
		
	end
end
