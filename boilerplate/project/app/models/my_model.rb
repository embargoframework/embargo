require 'ostruct'

class MyModel
	def self.find
		OpenStruct.new(my_item: "The Embargo is on!")
	end
end