require 'byebug'

def my_min(arr)
  arr.each_with_index do |el1, i1|
    i2 = 0
    while i2 < arr.length
      if i1 == i2
        i2 += 1 
      elsif el1 > arr[i2]
        break
      else
        return el1 if i2 == arr.length - 1
        i2+=1
      end
    end
    return el1 if i1 == arr.length - 1
  end
end

def my_min2(arr)
  smallest = arr.first
  arr.each_with_index do |el, i|
    next if i == 0
    smallest = el if el < smallest
  end
  smallest
end

def large_contig_sum1(arr)
  subs = []
  i = 0
  while i < arr.length
    j = i
    while j < arr.length
      subs << arr[i..j]
      j += 1
    end
    i += 1
  end
  subs = subs - [arr]    
  sum_arr = subs.map { |arr| arr.reduce(:+) }
  sum_arr.max
end

list = [2, 3, -6, 7, -6, 7]
p large_contig_sum1(list)

def large_contig_sum2(arr)
  current_sum = 0
  best_sum = nil
  arr.each do |el|
    current_sum += el
    current_sum = el if current_sum < el
    best_sum = current_sum if best_sum.nil? || current_sum > best_sum
  end
  best_sum
end

list = [2, 3, -6, 7, -6, 7]
p large_contig_sum2(list)



def subs(arr)
  subs = []
  i = 0
  while i < arr.length
    j = i 
    while j < arr.length
      subs << arr[i..j]
      j += 1
    end
    i += 1
  end
  subs
end

list = [2, 3, -6, 7, -6, 7]
p subs(list)

def anagrams?(str1,str2)
   arr1 = str1.chars.permutation.to_a
  arr1.include?(str2.chars)
end

p anagrams?("elvis", "lives")
a = "hello" 
p b = a.chars
p c = a.chars.shuffle
c.include?(b)


def anagrams2?(str1,str2)
  copy = str1.dup
  copy.each_char do |ch|
    copy.delete!(ch) if str2.include?(ch)
  end 
  copy.empty?
end

anagrams?("elvis", "lives")

def anagrams3?(str1,str2)
  str1.sort == str2.sort
end

anagrams?("elvis", "lives")

def anagrams4?(str1,str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char do |ch|
    hash1[ch] += 1
  end
  str2.each_char do |ch|
    hash2[ch] += 1
  end
  hash1 == hash2
  
    
end