require 'ostruct'

class MyModel
	def self.find
		OpenStruct.new(my_item: "Hello world!")
	end
end