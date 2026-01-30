rockspec_format = "3.0"

package = "destiny-matrix-energy"
version = "0.1.0-1"

source = {
  url = "git+https://github.com/YOUR_GITHUB_USER/destiny-matrix-energy",
  tag = "v0.1.0"
}

description = {
  summary = "Destiny Matrix energy/points calculator",
  detailed = "Calculates Destiny Matrix points, purposes, chakra chart (energy/physics/emotions), and year-cycle values from a birth date.",
  homepage = "https://github.com/YOUR_GITHUB_USER/destiny-matrix-energy",
  license = "MIT"
}

dependencies = {
  "lua >= 5.1"
}

build = {
  type = "builtin",
  modules = {
    ["destiny_matrix.energy"] = "src/destiny_matrix/energy.lua"
  }
}
