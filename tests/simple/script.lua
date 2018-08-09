-- Sample function to see if we can call it
function reverse (str)
  return str.reverse(str)
end

-- Convert our message inside our imported data and return it
data.message = reverse(data.message)

return data
