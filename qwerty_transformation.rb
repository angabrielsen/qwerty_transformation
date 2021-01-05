# TO RUN: navigate to dir with file and input `ruby qwerty_transformation.rb [yourStringHere]`
# Don't have Ruby? See here: https://www.ruby-lang.org/en/documentation/installation/

$qwertyKey = [
  [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" ],
  [ "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P" ],
  [ "A", "S", "D", "F", "G", "H", "J", "K", "L", ";" ],
  [ "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/" ]
]

$qwertyTransform = $qwertyKey

hipsterIpsum = "I'm baby sustainable biodiesel selfies, adaptogen mlkshk crucifix hexagon chambray banh mi craft beer kogi. Leggings freegan hashtag 8-bit disrupt actually. Vice actually next level, chicharrones drinking vinegar subway tile fixie street art enamel pin. La croix microdosing sartorial adaptogen freegan."

def getCommands(transformationString, hipsterIpsum)
# coded myself into a bit of a corner here and did a messy .reject of all the S's as they still remained after seperating out the numbers from the H's and V's
  commands = transformationString.scan(/\d+|\D+/).map {|e| e.scan(/\D/).empty? ? "S" + e : e.split("") }.flatten.reject {|e| e == "S"}

  print "#{commands}\n\n"

  executeCommands(commands, hipsterIpsum)
end

def executeCommands(commands, hipsterIpsum)
  for comm in commands
    if comm == "H"
      horizontalFlip
    elsif comm == "V"
      verticalFlip
    else
      howMany = comm.delete("S").to_i

      shiftKeys(howMany)
    end
  end

  retypeMachine(hipsterIpsum)
end

def horizontalFlip
  $qwertyTransform = $qwertyTransform.map {|r| r.reverse}

  print "horizontal: #{$qwertyTransform}\n\n"
end

def verticalFlip
  $qwertyTransform = $qwertyTransform.reverse

  print "vertical: #{$qwertyTransform}\n\n"
end

def shiftKeys(howMany)
  print "Shift Keys #{howMany} movements\n\n"
end

def retypeMachine(hipsterIpsum)
  retypedHipsterIpsum = hipsterIpsum.split("")

# here I would do something like for each element in retypedHipsterIpsum find the index of its match in $qwertyTransform and then find the character that matches that index in $qwertyKey and join the chars back together
# some considerations would include not forgetting spaces in the original text

#   print retypedHipsterIpsum
end

transformationString = ARGV.to_s

getCommands(transformationString, hipsterIpsum)