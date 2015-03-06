class Proc
	def callback(callable, *args)
		self === Class.new do
			method_name = callable.to_sym
			define_method(method_name) do |&block| 
				block.nil? true : block.call(*args) 
			end

			define_method("#{method_name}?") { true }

			def method_missing(method_name, *args, &block) false; end
		end.new
	end
end

def tweet(message, &block)
  Twitter.update(message)
  block.callback :success
rescue => e
  block.callback :failure, e.message
end

tweet "Ruby methods with multiple blocks. #lolruby" do |on|
  on.success do
    puts "Tweet successful!"
  end
  on.failure do |status|
    puts "Error: #{status}"
  end
end

tweet "Ruby methods with multiple blocks. #lolruby" do |update|
  puts "Tweet successful!" if update.success?
  puts "Sorry, something went wrong." if update.failure?
end
