module SalesPoC
  DELIVERY_RULES = [
    { min: 0, max: 50, charge: 4.95 },
    { min: 50, max: 90, charge: 2.95 },
    { min: 90, max: Float::INFINITY, charge: 0 }
  ]
end
