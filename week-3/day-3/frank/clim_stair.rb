def climbStairs(n)
  return 1 if n == 1
  dp = [1 , 2]
  2.upto(n - 1) do |i|
    dp[i] = dp[i - 1] + dp[i - 2]
  end
  return dp[n - 1];
end
 

puts climbStairs(ARGV.first.to_i)

