def HumanList raw
  raw.scan(/"([^"]*)"/).map(&:first)
end