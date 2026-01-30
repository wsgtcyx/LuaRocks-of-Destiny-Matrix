# destiny-matrix-energy (Lua)

A small Lua module that calculates Destiny Matrix values (points, purposes, chakra “heart chart” energy/physics/emotions, and year-cycle values) from a birth date.

This is a direct port of the calculation logic used in this repository’s website (`src/code.js` + `src/script_2025.js`).

## Install

After publishing to LuaRocks:

```sh
luarocks install destiny-matrix-energy
```

For local development (no LuaRocks):

```sh
lua -e "package.path='src/?.lua;src/?/init.lua;src/?/?.lua;'..package.path; print(require('destiny_matrix.energy').calculate('1990-12-31').chartHeart.resultenergy)"
```

## Usage

```lua
local energy = require("destiny_matrix.energy")

-- ISO date string
local result = energy.calculate("1990-12-31")
print(result.chartHeart.resultenergy)

-- Table input
local result2 = energy.calculate({ year = 1990, month = 12, day = 31 })
print(result2.points.epoint, result2.purposes.generalpurpose)
```

## API

- `reduce_number(n)` -> integer
- `calculate_year(year)` -> integer
- `base_from_ymd(year, month, day[, opts])` -> `apoint, bpoint, cpoint`
- `parse_iso_date("YYYY-MM-DD")` -> `year, month, day`
- `calculate_from_base(apoint, bpoint, cpoint)` -> result table
- `calculate(...)` -> result table

`opts.validate` defaults to `true` (checks calendar-valid dates); set `validate = false` to skip validation.

## Publishing to LuaRocks

1. Put this folder in its own git repository (recommended).
2. Edit the `.rockspec` `source.url` to point at your repository (and tag).
3. Create a release tag (example `v0.1.0`) matching the rockspec version.
4. Upload:

```sh
luarocks upload destiny-matrix-energy-0.1.0-1.rockspec --api-key="$LUAROCKS_API_KEY"
```

## License

Add a license file before publishing if you plan to distribute this widely.
