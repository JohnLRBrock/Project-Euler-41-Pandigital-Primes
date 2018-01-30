def pandigital?(n)
  digit_array = n.digits
  1.upto(digit_array.length) do |n|
    return false unless digit_array.include?(n)
  end
  true
end

def sieve(max)
  $sieve = Array.new(max + 1, true)
  $sieve[0] = false
  $sieve[1] = false
  $primes = []
  $sieve.each_with_index do |bool, i|
    if bool
      $primes.push(i)
      j = 0
      while (i ** 2 + (i * j)) <= max
        $sieve[i ** 2 + (i * j)] = false
        j += 1
      end
    end
  end
end

def prime?(n)
  if n < $sieve.length
    return $sieve[n]
  else
    $primes.each do |prime|
      return false if n % prime == 0
    end
  end
  true
end

def solve
  limit = 31427
  sieve(limit)
  # 987654321.downto(2) { |n| return n if pandigital?(n) && prime?(n) }
  i = 987654321
  while i > 2
    i -=2
    return i if pandigital?(i) && prime?(i)
  end
  false
end

start = Time.now
prime = solve
finish = Time.now
puts prime
puts finish - start