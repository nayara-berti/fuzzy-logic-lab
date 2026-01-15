function tip = tip_fuzzy(food_quality, service_quality)

  pkg load fuzzy-logic-toolkit;

  % Create fuzzy inference system
  fis = newfis('tip_calculator');

  % Input: Food Quality
  fis = addvar(fis, 'input', 'food', [0 10]);
  fis = addmf(fis, 'input', 1, 'poor', 'trimf', [0 0 5]);
  fis = addmf(fis, 'input', 1, 'good', 'trimf', [3 5 7]);
  fis = addmf(fis, 'input', 1, 'excellent', 'trimf', [5 10 10]);

  % Input: Service Quality
  fis = addvar(fis, 'input', 'service', [0 10]);
  fis = addmf(fis, 'input', 2, 'poor', 'trimf', [0 0 5]);
  fis = addmf(fis, 'input', 2, 'good', 'trimf', [3 5 7]);
  fis = addmf(fis, 'input', 2, 'excellent', 'trimf', [5 10 10]);

  % Output: Tip
  fis = addvar(fis, 'output', 'tip', [0 20]);
  fis = addmf(fis, 'output', 1, 'low', 'trimf', [0 5 10]);
  fis = addmf(fis, 'output', 1, 'medium', 'trimf', [5 10 15]);
  fis = addmf(fis, 'output', 1, 'high', 'trimf', [10 20 20]);

  % Rules
  rules = [
    1 1 1 1 1;
    1 2 2 1 1;
    1 3 2 1 1;
    2 1 2 1 1;
    2 2 2 1 1;
    2 3 3 1 1;
    3 1 2 1 1;
    3 2 3 1 1;
    3 3 3 1 1;
  ];

  fis = addrule(fis, rules);

  % Evaluate
  tip = evalfis([food_quality service_quality], fis);

end
