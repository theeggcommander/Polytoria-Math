# PolyMath

A lightweight math utility library for **Polytoria** (Lua 5.2).

PolyMath fills the gaps left by Lua’s primitive math library with common helpers used in games, animation, and simulation. PolyMath is a simple, drop-in module

---

## Installation

1. Download `PolyMath.lua`
2. Place it in your project
3. Require it like any other module:

```lua
local PolyMath = require(path.to.PolyMath)
```

## API Overview
**Clamping**
```lua
PolyMath.clamp(x, min, max)
PolyMath.clamp01(x)
```

**Mapping & Interpolation**
```lua
PolyMath.map(x, inMin, inMax, outMin, outMax, clamp)
PolyMath.lerp(a, b, t, clamp)
PolyMath.inverseLerp(a, b, x, clamp)
```

**Numeric Utilities**
```lua
PolyMath.abs(x)
PolyMath.floor(x)
PolyMath.ceil(x)
PolyMath.trunc(x)
PolyMath.round(x, digits)
PolyMath.sign(x)
PolyMath.mod(x, m)
```

**Comparisons**
```lua
PolyMath.approximately(a, b, epsilon)
```

**Motion**
```lua
PolyMath.moveTowards(current, target, maxDelta)
```
