print("-----------------START-----------------")

-- Main function for calculating IP's in between each other 
function count_ips_between(start_ip, end_ip)
  local function ip_to_int(ip1,ip2)
    -- Declaring placeholders for IP address groups 
    local parts1 = {}
    local parts2 = {}

    -- If theres a match of colon then it is identified as a IPv6 address, else --> IPv4
    if string.match(ip1, ":") then --IPv6 main transformation from colon-hexadecimal to decimal representation
      -- Use of regex to match out values between colons, converting the values from hexadecimal to decimal and asigning them to a table
      for part in string.gmatch(ip1, "[a-fA-F0-9]?[a-fA-F0-9]?[a-fA-F0-9]?[a-fA-F0-9]?") do
        table.insert(parts1, tonumber(part, 16))
      end
      for part in string.gmatch(ip2, "[a-fA-F0-9]?[a-fA-F0-9]?[a-fA-F0-9]?[a-fA-F0-9]?") do
        table.insert(parts2, tonumber(part, 16))
      end
      local result = 0
      --[[Result is calculated by substracting parallel groups of the IP addresses and by multiplying that difference 
      by its group position within the IPv6 address base multiplied by 16 bits raised to the power of 2]]
      for i = 1, #parts1 do
        result = result + (parts2[i] - parts1[i]) * math.pow(2, (8 - i) * 16)
      end
      return result

    else --IPv4 main transformation from dotted-decimal address to decimal representation
      local result1 = 0
      local result2 = 0
      -- Use of regex to match out values between full stops and asigning them to a table
      for part in string.gmatch(ip1, "%d+") do
        table.insert(parts1, tonumber(part))
      end
      --[[The value is calculated by the folowing formula, each segment is multiplied by 256 
      raised to a power on group position in the address, calculated groups are added together]]
      result1 =  parts1[1] * 256^3 + parts1[2] * 256^2 + parts1[3] * 256 + parts1[4]
      for part in string.gmatch(ip2, "%d+") do
        table.insert(parts2, tonumber(part))
      end
      -- Final result is calculated by substracting the decimal representations of IPv4 adress
      result2 = parts2[1] * 256^3 + parts2[2] * 256^2 + parts2[3] * 256 + parts2[4]
      return result2 - result1
    end
  end
  
  local count = ip_to_int(start_ip,end_ip)
  --Transforming count result to natural number and removing numbers floating point
  return math.floor(math.abs(count))
end

print("Input the desired IP's below: ")
--Reading user input, counting the values with given function and outputing the results
firstIP, secondIP = io.read("*l", "*l")
count = count_ips_between(firstIP, secondIP)
print("IP's inbetween IP addresses: "..count)