Local PolyMath = {}

local function swap(a, b)
	if a > b then
		local n = a
		a = b
		b = n	
	end
	return a, b
end

function PolyMath.clamp(x, lo, hi)
	if not tonumber(x) then return lo end
	if not tonumber(lo) or not tonumber(hi) then return end
	lo, hi = swap(lo, hi)

	if x < lo then x = lo end
	if x > hi then x = hi end

	return x
end

function PolyMath.clamp01(x)
	return PolyMath.clamp(x, 0, 1)
end

function PolyMath.wrap(x, lo, hi)
	local range = hi - lo
	return ((x - lo) % range + range) % range + lo
end

function PolyMath.map(x, inLo, inHi, outLo, outHi, clamp)
	if not tonumber(x) or not tonumber(inLo) or not tonumber(inHi) or not tonumber(outLo) or not tonumber(outHi) then return end

	local mapped = (x - inLo) * (outHi - outLo) / (inHi - inLo) + outLo

	if clamp == true then -- I'm adding '== true' incase 'clamp' is inputted as something truey (like an object)
		mapped = PolyMath.clamp(mapped, outLo, outHi)
	end

	return mapped
end

function PolyMath.lerp(a, b, t, clamp)
	if not tonumber(a) or not tonumber(b) or not tonumber(t) then return end
	
	if clamp == true then
		t = PolyMath.clamp01(t)
	end

	return a + (b - a) * t
end

function PolyMath.inverseLerp(a, b, x, clamp)
	if a == b then return 0 end

	local lerped = (x - a) / (b - a)
	
	if clamp then
		lerped = PolyMath.clamp01(lerped)
	end
	
	return lerped
end

function PolyMath.abs(x)
	if x < 0 then x = x * -1 end
	return x
end

function PolyMath.approximately(a, b, eps)
	if not tonumber(eps) then eps = 0.000001 end
	if not tonumber(a) or not tonumber(b) then return end

	return PolyMath.abs(a - b) <= eps
end

function PolyMath.floor(x)
	if x >= 0 then
        	return x - x % 1
    	else
        	local ip = x + (1 - x % 1)
        	if x == ip then
           		return ip
        	else
			return ip - 1
        	end
    	end
end

function PolyMath.ceil(x)
	if x >= 0 then
        	return x - x % 1 + 1
    	else
        	local ip = x + (1 - x % 1)
        	if x == ip then
           		return ip + 1
        	else
			return ip
        	end
    	end
end

function PolyMath.trunc(x)
	if x >= 0 then return PolyMath.floor(x) end
	if x < 0 then return PolyMath.ceil(x) end
end

function PolyMath.round(x, digs)
	if not tonumber(digs) then digs = 0 end

	local multiplier = 10^digs
	return PolyMath.floor(x * multiplier + 0.5) / multiplier
end

function PolyMath.sign(x)
	if not tonumber(x) then return 0 end
	if x < 0 then return -1 end
	if x > 0 then return 1 end
	return x
end

function PolyMath.mod(x, m)
	if not tonumber(x) or not tonumber(m) or m == 0 then return end
	return ((x % m) + m) % m
end

function PolyMath.moveTowards(c, t, d)
	if not tonumber(c) then return end
	if not tonumber(t) or not tonumber(d) then return c end
	if c == t then return t end

	local diff = t - c
	if PolyMath.abs(diff) <= d then return t end

	if diff > 0 then return c + d end
	return c - d
end

function PolyMath.deg2rad(d) return d * 0.017453292519943 end
function PolyMath.rad2deg(r) return r * 57.295779513082 end
function PolyMath.signNonZero(x) return x < 0 and -1 or 1 end

return PolyMath
