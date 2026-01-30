local M = {}

local function assertInteger(value, name)
  if type(value) ~= "number" or value ~= math.floor(value) then
    error((name or "value") .. " must be an integer", 3)
  end
end

local function isLeapYear(year)
  return (year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0)
end

local function daysInMonth(year, month)
  if month == 2 then
    return isLeapYear(year) and 29 or 28
  end
  if month == 4 or month == 6 or month == 9 or month == 11 then
    return 30
  end
  return 31
end

local function validateDate(year, month, day)
  assertInteger(year, "year")
  assertInteger(month, "month")
  assertInteger(day, "day")

  if year < 1 or year > 9999 then
    error("year must be between 1 and 9999", 3)
  end
  if month < 1 or month > 12 then
    error("month must be between 1 and 12", 3)
  end
  local maxDay = daysInMonth(year, month)
  if day < 1 or day > maxDay then
    error("day must be between 1 and " .. maxDay .. " for the given month/year", 3)
  end
end

-- Matches the site's behavior:
-- if n > 22, reduce once by summing the decimal digits of n (two-digit sum logic).
function M.reduce_number(n)
  assertInteger(n, "n")
  if n < 0 then
    error("n must be a non-negative integer", 2)
  end
  if n > 22 then
    return (n % 10) + math.floor(n / 10)
  end
  return n
end

function M.calculate_year(year)
  assertInteger(year, "year")
  if year < 0 then
    error("year must be a non-negative integer", 2)
  end
  local y = 0
  local tmp = year
  while tmp > 0 do
    y = y + (tmp % 10)
    tmp = math.floor(tmp / 10)
  end
  return M.reduce_number(y)
end

function M.base_from_ymd(year, month, day, opts)
  opts = opts or {}
  if opts.validate ~= false then
    validateDate(year, month, day)
  end

  local apoint = M.reduce_number(day)
  local bpoint = month
  local cpoint = M.calculate_year(year)
  return apoint, bpoint, cpoint
end

function M.parse_iso_date(value)
  if type(value) ~= "string" then
    error("date must be a string in YYYY-MM-DD format", 2)
  end
  local y, m, d = value:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$")
  if not y then
    error("date must be in YYYY-MM-DD format", 2)
  end
  return tonumber(y), tonumber(m), tonumber(d)
end

local function sum7(a, b, c, d, e, f, g)
  return a + b + c + d + e + f + g
end

function M.calculate_from_base(apoint, bpoint, cpoint)
  assertInteger(apoint, "apoint")
  assertInteger(bpoint, "bpoint")
  assertInteger(cpoint, "cpoint")

  local r = M.reduce_number

  local dpoint = r(apoint + bpoint + cpoint)
  local epoint = r(apoint + bpoint + cpoint + dpoint)
  local fpoint = r(apoint + bpoint)
  local gpoint = r(bpoint + cpoint)
  local hpoint = r(dpoint + apoint)
  local ipoint = r(cpoint + dpoint)
  local jpoint = r(dpoint + epoint)

  local npoint = r(cpoint + epoint)
  local lpoint = r(jpoint + npoint)
  local mpoint = r(lpoint + npoint)
  local kpoint = r(jpoint + lpoint)

  local qpoint = r(npoint + cpoint)
  local rpoint = r(jpoint + dpoint)
  local spoint = r(apoint + epoint)
  local tpoint = r(bpoint + epoint)

  local opoint = r(apoint + spoint)
  local ppoint = r(bpoint + tpoint)

  local upoint = r(fpoint + gpoint + hpoint + ipoint)
  local vpoint = r(epoint + upoint)
  local wpoint = r(spoint + epoint)
  local xpoint = r(tpoint + epoint)

  local f2point = r(fpoint + upoint)
  local f1point = r(fpoint + f2point)
  local g2point = r(gpoint + upoint)
  local g1point = r(gpoint + g2point)
  local i2point = r(ipoint + upoint)
  local i1point = r(ipoint + i2point)
  local h2point = r(hpoint + upoint)
  local h1point = r(hpoint + h2point)

  local afpoint = r(apoint + fpoint)
  local af1point = r(apoint + afpoint)
  local af2point = r(apoint + af1point)
  local af3point = r(afpoint + af1point)
  local af4point = r(afpoint + fpoint)
  local af5point = r(afpoint + af4point)
  local af6point = r(af4point + fpoint)
  local fbpoint = r(fpoint + bpoint)
  local fb1point = r(fpoint + fbpoint)
  local fb2point = r(fpoint + fb1point)
  local fb3point = r(fbpoint + fb1point)
  local fb4point = r(fbpoint + bpoint)
  local fb5point = r(fbpoint + fb4point)
  local fb6point = r(fb4point + bpoint)
  local bgpoint = r(bpoint + gpoint)
  local bg1point = r(bpoint + bgpoint)
  local bg2point = r(bpoint + bg1point)
  local bg3point = r(bgpoint + bg1point)
  local bg4point = r(bgpoint + gpoint)
  local bg5point = r(bgpoint + bg4point)
  local bg6point = r(bg4point + gpoint)
  local gcpoint = r(gpoint + cpoint)
  local gc1point = r(gpoint + gcpoint)
  local gc2point = r(gpoint + gc1point)
  local gc3point = r(gcpoint + gc1point)
  local gc4point = r(gcpoint + cpoint)
  local gc5point = r(gcpoint + gc4point)
  local gc6point = r(gc4point + cpoint)
  local cipoint = r(cpoint + ipoint)
  local ci1point = r(cpoint + cipoint)
  local ci2point = r(cpoint + ci1point)
  local ci3point = r(cipoint + ci1point)
  local ci4point = r(cipoint + ipoint)
  local ci5point = r(cipoint + ci4point)
  local ci6point = r(ci4point + ipoint)
  local idpoint = r(ipoint + dpoint)
  local id1point = r(ipoint + idpoint)
  local id2point = r(ipoint + id1point)
  local id3point = r(idpoint + id1point)
  local id4point = r(idpoint + dpoint)
  local id5point = r(idpoint + id4point)
  local id6point = r(id4point + dpoint)
  local dhpoint = r(dpoint + hpoint)
  local dh1point = r(dpoint + dhpoint)
  local dh2point = r(dpoint + dh1point)
  local dh3point = r(dhpoint + dh1point)
  local dh4point = r(dhpoint + hpoint)
  local dh5point = r(dhpoint + dh4point)
  local dh6point = r(dh4point + hpoint)
  local hapoint = r(hpoint + apoint)
  local ha1point = r(hpoint + hapoint)
  local ha2point = r(hpoint + ha1point)
  local ha3point = r(hapoint + ha1point)
  local ha4point = r(hapoint + apoint)
  local ha5point = r(hapoint + ha4point)
  local ha6point = r(ha4point + apoint)

  local skypoint = r(bpoint + dpoint)
  local earthpoint = r(apoint + cpoint)
  local perspurpose = r(skypoint + earthpoint)
  local femalepoint = r(gpoint + hpoint)
  local malepoint = r(fpoint + ipoint)
  local socialpurpose = r(femalepoint + malepoint)
  local generalpurpose = r(perspurpose + socialpurpose)
  local planetarypurpose = r(socialpurpose + generalpurpose)

  local points = {
    apoint = apoint,
    bpoint = bpoint,
    cpoint = cpoint,
    dpoint = dpoint,
    epoint = epoint,
    fpoint = fpoint,
    gpoint = gpoint,
    hpoint = hpoint,
    ipoint = ipoint,
    jpoint = jpoint,
    kpoint = kpoint,
    lpoint = lpoint,
    mpoint = mpoint,
    npoint = npoint,
    opoint = opoint,
    ppoint = ppoint,
    qpoint = qpoint,
    rpoint = rpoint,
    spoint = spoint,
    tpoint = tpoint,
    upoint = upoint,
    vpoint = vpoint,
    wpoint = wpoint,
    xpoint = xpoint,
    f2point = f2point,
    f1point = f1point,
    g2point = g2point,
    g1point = g1point,
    i2point = i2point,
    i1point = i1point,
    h2point = h2point,
    h1point = h1point
  }

  local years = {
    afpoint = afpoint,
    af1point = af1point,
    af2point = af2point,
    af3point = af3point,
    af4point = af4point,
    af5point = af5point,
    af6point = af6point,
    fbpoint = fbpoint,
    fb1point = fb1point,
    fb2point = fb2point,
    fb3point = fb3point,
    fb4point = fb4point,
    fb5point = fb5point,
    fb6point = fb6point,
    bgpoint = bgpoint,
    bg1point = bg1point,
    bg2point = bg2point,
    bg3point = bg3point,
    bg4point = bg4point,
    bg5point = bg5point,
    bg6point = bg6point,
    gcpoint = gcpoint,
    gc1point = gc1point,
    gc2point = gc2point,
    gc3point = gc3point,
    gc4point = gc4point,
    gc5point = gc5point,
    gc6point = gc6point,
    cipoint = cipoint,
    ci1point = ci1point,
    ci2point = ci2point,
    ci3point = ci3point,
    ci4point = ci4point,
    ci5point = ci5point,
    ci6point = ci6point,
    idpoint = idpoint,
    id1point = id1point,
    id2point = id2point,
    id3point = id3point,
    id4point = id4point,
    id5point = id5point,
    id6point = id6point,
    dhpoint = dhpoint,
    dh1point = dh1point,
    dh2point = dh2point,
    dh3point = dh3point,
    dh4point = dh4point,
    dh5point = dh5point,
    dh6point = dh6point,
    hapoint = hapoint,
    ha1point = ha1point,
    ha2point = ha2point,
    ha3point = ha3point,
    ha4point = ha4point,
    ha5point = ha5point,
    ha6point = ha6point
  }

  local purposes = {
    skypoint = skypoint,
    earthpoint = earthpoint,
    perspurpose = perspurpose,
    femalepoint = femalepoint,
    malepoint = malepoint,
    socialpurpose = socialpurpose,
    generalpurpose = generalpurpose,
    planetarypurpose = planetarypurpose
  }

  local chartHeart = {
    sahphysics = apoint,
    ajphysics = opoint,
    vishphysics = spoint,
    anahphysics = wpoint,
    manphysics = epoint,
    svadphysics = jpoint,
    mulphysics = cpoint,

    sahenergy = bpoint,
    ajenergy = ppoint,
    vishenergy = tpoint,
    anahenergy = xpoint,
    manenergy = epoint,
    svadenergy = npoint,
    mulenergy = dpoint,

    sahemotions = r(apoint + bpoint),
    ajemotions = r(opoint + ppoint),
    vishemotions = r(spoint + tpoint),
    anahemotions = r(wpoint + xpoint),
    manemotions = r(epoint + epoint),
    svademotions = r(jpoint + npoint),
    mulemotions = r(cpoint + dpoint)
  }

  chartHeart.resultphysics = r(sum7(
    chartHeart.sahphysics,
    chartHeart.ajphysics,
    chartHeart.vishphysics,
    chartHeart.anahphysics,
    chartHeart.manphysics,
    chartHeart.svadphysics,
    chartHeart.mulphysics
  ))
  chartHeart.resultenergy = r(sum7(
    chartHeart.sahenergy,
    chartHeart.ajenergy,
    chartHeart.vishenergy,
    chartHeart.anahenergy,
    chartHeart.manenergy,
    chartHeart.svadenergy,
    chartHeart.mulenergy
  ))
  chartHeart.resultemotions = r(sum7(
    chartHeart.sahemotions,
    chartHeart.ajemotions,
    chartHeart.vishemotions,
    chartHeart.anahemotions,
    chartHeart.manemotions,
    chartHeart.svademotions,
    chartHeart.mulemotions
  ))

  return {
    base = { apoint = apoint, bpoint = bpoint, cpoint = cpoint },
    points = points,
    purposes = purposes,
    chartHeart = chartHeart,
    years = years
  }
end

function M.calculate(input, month, day, opts)
  if type(input) == "table" then
    local year = input.year or input.y
    local m = input.month or input.m
    local d = input.day or input.d
    local apoint, bpoint, cpoint = M.base_from_ymd(year, m, d, opts)
    return M.calculate_from_base(apoint, bpoint, cpoint)
  end

  if type(input) == "string" then
    local year, m, d = M.parse_iso_date(input)
    local apoint, bpoint, cpoint = M.base_from_ymd(year, m, d, opts)
    return M.calculate_from_base(apoint, bpoint, cpoint)
  end

  if type(input) == "number" then
    local year = input
    local apoint, bpoint, cpoint = M.base_from_ymd(year, month, day, opts)
    return M.calculate_from_base(apoint, bpoint, cpoint)
  end

  error("unsupported input; use calculate({year=,month=,day=}) or calculate('YYYY-MM-DD')", 2)
end

return M
