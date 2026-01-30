package.path = "../src/?.lua;../src/?/?.lua;" .. package.path

local energy = require("destiny_matrix.energy")

local result = energy.calculate("1990-12-31")

assert(result.points.apoint == 4, "apoint")
assert(result.points.bpoint == 12, "bpoint")
assert(result.points.cpoint == 19, "cpoint")

assert(result.points.dpoint == 8, "dpoint")
assert(result.points.epoint == 7, "epoint")
assert(result.points.upoint == 5, "upoint")

assert(result.purposes.generalpurpose == 12, "generalpurpose")
assert(result.purposes.planetarypurpose == 17, "planetarypurpose")

assert(result.chartHeart.resultphysics == 17, "chartHeart.resultphysics")
assert(result.chartHeart.resultenergy == 12, "chartHeart.resultenergy")
assert(result.chartHeart.resultemotions == 11, "chartHeart.resultemotions")

assert(result.years.afpoint == 20, "years.afpoint")
assert(result.years.af1point == 6, "years.af1point")
assert(result.years.fbpoint == 10, "years.fbpoint")

print("ok")
