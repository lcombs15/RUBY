class HealthProfile
	attr_accessor :first
	attr_accessor :last
	attr_accessor :gender
	attr_accessor :birthYear
	attr_accessor :currentYear
	attr_accessor :height
	attr_accessor :weight
	attr_accessor :maxheartrate
	
	# Constructor
	def initialize(first, last, gender, birthYear, currentYear, height, weight)
		@first = first
		@last = last
		@gender = gender
		@currentYear = currentYear
		@birthYear = birthYear
		@height = height
		@weight = weight	
	end
	
	def getAge()
		return @currentYear - @birthYear
	end
	
	def getMaxHeartRate()
		return 220 - getAge()
	end
	
	def getBMI()
		return ((@weight * 703) / (@height**2.0)).round(1)
	end
	
	def getTargetHeartRateMin()
		return (getMaxHeartRate() / 2.0).round(0)
	end
	
	def getTargetHeartRateMax()
		return (getMaxHeartRate * 0.89).round(0)
	end
	
	def displayHealthProfile()
		puts "HEALTH PROFILE FOR: #{@first} #{@last}\n"\
			"*************************************\n"\
			"Gender: #{@gender}\n"\
			"Age: #{getAge()}\n"\
			"Height (inches): #{@height}\n"\
			"Max heart rate: #{getMaxHeartRate()}\n\n"
		
		puts "Target heart rate range\n"\
			"************************\n"\
			"Minimum: #{getTargetHeartRateMin()}\n"\
			"Maximum: #{getTargetHeartRateMax()}\n"\
			"BMI: #{getBMI()}\n\n"
			
		print "BMI VALUES\n"\
			"***************\n"\
			"Underweight:\tless than 18.5\n"\
			"Normal:\t\tbetween 18.5 and 24.9\n"\
			"Overweight:\tbetween 25 and 29.9\n"\
			"Obese:\t\t30 or greater"		
	end
end