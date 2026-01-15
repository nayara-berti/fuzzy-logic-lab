printf("=== Tip Calculator Demo ===\n\n");

food = 8;
service = 9;

printf("Inputs:\n");
printf("Food quality: %d\n", food);
printf("Service quality: %d\n\n", service);

printf("Basic (deterministic) approach:\n");
basic_tip = tip_basic(food, service);
printf("Tip: %d%%\n\n", basic_tip);

printf("Fuzzy Logic approach:\n");
fuzzy_tip = tip_fuzzy(food, service);
printf("Tip: %.2f%%\n", fuzzy_tip);
