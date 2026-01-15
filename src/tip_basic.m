function tip = tip_basic(food_quality, service_quality)

  % Validate inputs (0 to 10)
  if food_quality < 0 || food_quality > 10 || service_quality < 0 || service_quality > 10
    error("Inputs must be between 0 and 10");
  end

  average = (food_quality + service_quality) / 2;

  if average < 4
    tip_percentage = 5;
  elseif average < 7
    tip_percentage = 10;
  else
    tip_percentage = 15;
  end

  tip = tip_percentage;

end
