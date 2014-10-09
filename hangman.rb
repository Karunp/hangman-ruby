#!/usr/bin/env ruby

#Karun Pandit
#CINS 465
#Program 4


num_guesses = 10

#originally used to store all words from the file
myarray = []
newarray = []
#specifies the range of our word size
word_size = (5..20).to_a

#our range of what we can use; used to check against our guess (called my_guess)
guess_range = ('a'..'z').to_a

#this array is used to store all of our guesses
guess_array = []

#open up the file and read in each word
myarray = File.read("words.txt").split("\n")

targetword = []

testarray = [] 


 print "Enter a word size between 5-20: "
 my_size = gets.to_i

 if my_size.to_i < 5
   word_size = 5
 elsif my_size.to_i > 20
   word_size = 20
 else
   word_size = my_size
 end

#picks only words with specified size. 
newarray = myarray.map.select {|x|x if x.size == word_size}
found = true

def myfunction(size)
  size.times do |i|
    print '_'
  end
end


while found
   
  break if found == false || num_guesses == 0  
   print "enter guess: "
   my_guess = gets.chomp
   newarray.select! {|e| e unless e.include? "#{my_guess}"} 
   myfunction(word_size) unless newarray.empty?
  # puts newarray 
  if newarray.size - 1 > 1
     unless  newarray.include? "#{my_guess}"
	targetword = newarray[rand(newarray.length)]
      end
  end    
  if guess_array.include? "#{my_guess}"
     puts "you already guessed " + "#{my_guess}"
  elsif guess_range.include?("#{my_guess}")
     guess_array.push(my_guess) unless targetword.include? "#{my_guess}"
     num_guesses = num_guesses - 1 unless targetword.include? "#{my_guess}"
  else
	puts "only lowercase letters a-z are allowed"
  end
  puts "(#{guess_array})  " + "#{num_guesses} remaining"

=begin
if newarray.empty?
  #targetword.each_line do |char|
   puts testarray = targetword.tr!("^#{my_guess}", "_")
   #end
end
=end



  if newarray.empty?
    #find how to store the matching letters in order to actually win.
    matchingletters = targetword.tr("^#{my_guess}", "_")
    if matchingletters == targetword
    puts "You won, the word was: " + "#{targetword}"
    found = false    
   end
  end
puts matchingletters
end
