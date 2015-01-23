def i_am_a_function(x)
	puts "No! You are a method of #{self}, who is instance of #{self.class} class" 
	x ** 2
end

puts self.class.methods.sort

def hello_goodbye
	"You say goodbye, i say hello."
end

puts hello_goodbye.object_id == "You say goodbye, i say hello.".object_id 
