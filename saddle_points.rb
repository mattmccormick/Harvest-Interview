require 'pp'

abort "Please provide at least one input file" if ARGV.count == 0

ARGV.each do |f|
	next if !File.exists?(f)
	
	File.open(f).each_line{ |line|
		found = false
		arr = eval(line)	# read into variable - assuming properly formatted or else will throw exception
		puts '================='

		arr.each_index do |i|
			row = arr[i]
			max = row.max

			# need to traverse the row because there could be multiple max values equal to each other
			row.each_index do |j|
				if row[j] == max	# these cells contain the max value
					cols = Array.new(5)
					(0..4).each do |k|
						cols[k] = arr[k][j]
					end
					# if this value is the max of the row and min of the col then it is a saddle point
					if cols.min == max
						puts "(#{i}, #{j})"
						found = true
					end
				end
			end
		end

		puts "No saddle points found" if !found
	}
end



