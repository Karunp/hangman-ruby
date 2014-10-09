#!/usr/bin/env ruby


#go back and make this constant
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

myarray = File.read("words.txt").split("\n")

 puts "Enter a word size between 5-20"
 my_size = gets.to_i

 if my_size < 5
   word_size = 5
 elsif my_size > 20
   word_size = 20
 else
   word_size = my_size
 end

#picks only words with specified size.  Go back and use map! when complete   
newarray = myarray.map.select {|x| x if x.size == word_size}

targetword = []
def myfunction(size)
  size.times do |i|
    print ' - '
  end
end


while num_guesses !=0

   puts "enter guess"
   my_guess = gets.chomp
   newarray.select! {|e| e unless e.include? "#{my_guess}"}
   #case1: does the array already have your guess? it wont at first therefore move on 
   if guess_array.include?("#{my_guess}")
      puts "you already guessed that"
   #case2:  did the user enter something besides a-z
   elsif guess_range.include?("#{my_guess}")
        guess_array.push(my_guess)
        num_guesses = num_guesses -1
   else
      puts"Wrong:  only pick letters 'a'-'z'"
   end
  puts "(#{guess_array})" + " #{num_guesses} remaining"
  myfunction(word_size)  
 
  newarray.each do |x|
   if x.include? "#{my_guess}"
 	targetword = newarray[rand(newarray.length)]
    end
 end
         # play an honest game(targetword)
          print "TARGETWORD:::"
          puts targetword
    
   
end 
