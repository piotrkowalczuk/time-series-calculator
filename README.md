time-series-calculator
======================

Input data format:
```
  timestamp | value
  -------------------
  1355270609	1.80215
  1355270621	1.80185
  1355270646	1.80195
  1355270702	1.80225
  1355270702	1.80215
  1355270829	1.80235
```  
Output data format:
```
  timestamp | value | nbOfRows | sum | min | max
  ------------------------------------------------
  1355270609 1,802150 1 1,802150 1,802150 1,802150
  1355270621 1,801850 2 3,604000 1,801850 1,802150
  1355270646 1,801950 3 5,405950 1,801850 1,802150
  1355270702 1,802250 2 3,604200 1,801950 1,802250
  1355270702 1,802150 3 5,406350 1,801950 1,802250
  1355270829 1,802350 1 1,802350 1,802350 1,802350
  1355270854 1,802050 2 3,604400 1,802050 1,802350
  1355270868 1,802250 3 5,406650 1,802050 1,802350
```

Tests:
```
npm test
```
  
  
  
