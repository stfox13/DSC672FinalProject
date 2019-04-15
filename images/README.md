# Exploratory Data Analysis (EDA) Images
#### EDA Overview: Summary Statistics
---
|                         |consumption_df (N = 70,072) |
|:------------------------|:---------------------------|
|**Electricity per SQFT** |&nbsp;&nbsp;                |
|&nbsp;&nbsp; min         |0.0001484373                |
|&nbsp;&nbsp; max         |0.01562244                  |
|&nbsp;&nbsp; mean (sd)   |0.00 &plusmn; 0.00          |
|**Solar Elevation**      |&nbsp;&nbsp;                |
|&nbsp;&nbsp; min         |-70.14049                   |
|&nbsp;&nbsp; max         |70.27031                    |
|&nbsp;&nbsp; mean (sd)   |0.29 &plusmn; 34.75         |
|**Cloud Cover Fraction** |&nbsp;&nbsp;                |
|&nbsp;&nbsp; min         |0                           |
|&nbsp;&nbsp; max         |1                           |
|&nbsp;&nbsp; mean (sd)   |0.64 &plusmn; 0.40          |
|**Dew Point**            |&nbsp;&nbsp;                |
|&nbsp;&nbsp; min         |-31.7                       |
|&nbsp;&nbsp; max         |24.4                        |
|&nbsp;&nbsp; mean (sd)   |3.94 &plusmn; 10.60         |
|**Humidity Fraction**    |&nbsp;&nbsp;                |
|&nbsp;&nbsp; min         |0.18                        |
|&nbsp;&nbsp; max         |1                           |
|&nbsp;&nbsp; mean (sd)   |0.75 &plusmn; 0.18          |
|**Precipitable Water**   |&nbsp;&nbsp;                |
|&nbsp;&nbsp; min         |3                           |
|&nbsp;&nbsp; max         |45                          |
|&nbsp;&nbsp; mean (sd)   |16.90 &plusmn; 9.86         |
|**Temperature**          |&nbsp;&nbsp;                |
|&nbsp;&nbsp; min         |-27.2                       |
|&nbsp;&nbsp; max         |35.6                        |
|&nbsp;&nbsp; mean (sd)   |8.74 &plusmn; 11.57         |
|**Visibility**           |&nbsp;&nbsp;                |
|&nbsp;&nbsp; min         |0                           |
|&nbsp;&nbsp; max         |32.2                        |
|&nbsp;&nbsp; mean (sd)   |14.38 &plusmn; 6.92         |

---

#### EDA Overview: Summary Statistics by Sector

---

|                         |Sector: FOOD_SERVICE (N = 8,759) |Sector: GROCERY (N = 8,759) |Sector: HEALTH_CARE (N = 8,759) |Sector: K12_SCHOOLS (N = 8,759) |Sector: LODGING (N = 8,759) |Sector: OFFICE (N = 8,759) |Sector: RESIDENTIAL (N = 8,759) |Sector: STAND_ALONE_RETAIL (N = 8,759) |
|:------------------------|:--------------------------------|:---------------------------|:-------------------------------|:-------------------------------|:---------------------------|:--------------------------|:-------------------------------|:--------------------------------------|
|**Electricity per SQFT** |&nbsp;&nbsp;                     |&nbsp;&nbsp;                |&nbsp;&nbsp;                    |&nbsp;&nbsp;                    |&nbsp;&nbsp;                |&nbsp;&nbsp;               |&nbsp;&nbsp;                    |&nbsp;&nbsp;                           |
|&nbsp;&nbsp; min         |0.0037762306                     |0.0016740015                |0.0018693575                    |0.0005404738                    |0.0007389245                |0.0003500289               |0.0004363200                    |0.0001484373                           |
|&nbsp;&nbsp; max         |0.015622438                      |0.008260292                 |0.006404073                     |0.004645773                     |0.003011645                 |0.006062273                |0.002016149                     |0.004112562                            |
|&nbsp;&nbsp; mean (sd)   |0.01 &plusmn; 0.00               |0.00 &plusmn; 0.00          |0.00 &plusmn; 0.00              |0.00 &plusmn; 0.00              |0.00 &plusmn; 0.00          |0.00 &plusmn; 0.00         |0.00 &plusmn; 0.00              |0.00 &plusmn; 0.00                     |
|**Solar Elevation**      |&nbsp;&nbsp;                     |&nbsp;&nbsp;                |&nbsp;&nbsp;                    |&nbsp;&nbsp;                    |&nbsp;&nbsp;                |&nbsp;&nbsp;               |&nbsp;&nbsp;                    |&nbsp;&nbsp;                           |
|&nbsp;&nbsp; min         |-70.14049                        |-70.14049                   |-70.14049                       |-70.14049                       |-70.14049                   |-70.14049                  |-70.14049                       |-70.14049                              |
|&nbsp;&nbsp; max         |70.27031                         |70.27031                    |70.27031                        |70.27031                        |70.27031                    |70.27031                   |70.27031                        |70.27031                               |
|&nbsp;&nbsp; mean (sd)   |0.29 &plusmn; 34.75              |0.29 &plusmn; 34.75         |0.29 &plusmn; 34.75             |0.29 &plusmn; 34.75             |0.29 &plusmn; 34.75         |0.29 &plusmn; 34.75        |0.29 &plusmn; 34.75             |0.29 &plusmn; 34.75                    |
|**Cloud Cover Fraction** |&nbsp;&nbsp;                     |&nbsp;&nbsp;                |&nbsp;&nbsp;                    |&nbsp;&nbsp;                    |&nbsp;&nbsp;                |&nbsp;&nbsp;               |&nbsp;&nbsp;                    |&nbsp;&nbsp;                           |
|&nbsp;&nbsp; min         |0                                |0                           |0                               |0                               |0                           |0                          |0                               |0                                      |
|&nbsp;&nbsp; max         |1                                |1                           |1                               |1                               |1                           |1                          |1                               |1                                      |
|&nbsp;&nbsp; mean (sd)   |0.64 &plusmn; 0.40               |0.64 &plusmn; 0.40          |0.64 &plusmn; 0.40              |0.64 &plusmn; 0.40              |0.64 &plusmn; 0.40          |0.64 &plusmn; 0.40         |0.64 &plusmn; 0.40              |0.64 &plusmn; 0.40                     |
|**Dew Point**            |&nbsp;&nbsp;                     |&nbsp;&nbsp;                |&nbsp;&nbsp;                    |&nbsp;&nbsp;                    |&nbsp;&nbsp;                |&nbsp;&nbsp;               |&nbsp;&nbsp;                    |&nbsp;&nbsp;                           |
|&nbsp;&nbsp; min         |-31.7                            |-31.7                       |-31.7                           |-31.7                           |-31.7                       |-31.7                      |-31.7                           |-31.7                                  |
|&nbsp;&nbsp; max         |24.4                             |24.4                        |24.4                            |24.4                            |24.4                        |24.4                       |24.4                            |24.4                                   |
|&nbsp;&nbsp; mean (sd)   |3.94 &plusmn; 10.60              |3.94 &plusmn; 10.60         |3.94 &plusmn; 10.60             |3.94 &plusmn; 10.60             |3.94 &plusmn; 10.60         |3.94 &plusmn; 10.60        |3.94 &plusmn; 10.60             |3.94 &plusmn; 10.60                    |
|**Humidity Fraction**    |&nbsp;&nbsp;                     |&nbsp;&nbsp;                |&nbsp;&nbsp;                    |&nbsp;&nbsp;                    |&nbsp;&nbsp;                |&nbsp;&nbsp;               |&nbsp;&nbsp;                    |&nbsp;&nbsp;                           |
|&nbsp;&nbsp; min         |0.18                             |0.18                        |0.18                            |0.18                            |0.18                        |0.18                       |0.18                            |0.18                                   |
|&nbsp;&nbsp; max         |1                                |1                           |1                               |1                               |1                           |1                          |1                               |1                                      |
|&nbsp;&nbsp; mean (sd)   |0.75 &plusmn; 0.18               |0.75 &plusmn; 0.18          |0.75 &plusmn; 0.18              |0.75 &plusmn; 0.18              |0.75 &plusmn; 0.18          |0.75 &plusmn; 0.18         |0.75 &plusmn; 0.18              |0.75 &plusmn; 0.18                     |
|**Precipitable Water**   |&nbsp;&nbsp;                     |&nbsp;&nbsp;                |&nbsp;&nbsp;                    |&nbsp;&nbsp;                    |&nbsp;&nbsp;                |&nbsp;&nbsp;               |&nbsp;&nbsp;                    |&nbsp;&nbsp;                           |
|&nbsp;&nbsp; min         |3                                |3                           |3                               |3                               |3                           |3                          |3                               |3                                      |
|&nbsp;&nbsp; max         |45                               |45                          |45                              |45                              |45                          |45                         |45                              |45                                     |
|&nbsp;&nbsp; mean (sd)   |16.90 &plusmn; 9.86              |16.90 &plusmn; 9.86         |16.90 &plusmn; 9.86             |16.90 &plusmn; 9.86             |16.90 &plusmn; 9.86         |16.90 &plusmn; 9.86        |16.90 &plusmn; 9.86             |16.90 &plusmn; 9.86                    |
|**Temperature**          |&nbsp;&nbsp;                     |&nbsp;&nbsp;                |&nbsp;&nbsp;                    |&nbsp;&nbsp;                    |&nbsp;&nbsp;                |&nbsp;&nbsp;               |&nbsp;&nbsp;                    |&nbsp;&nbsp;                           |
|&nbsp;&nbsp; min         |-27.2                            |-27.2                       |-27.2                           |-27.2                           |-27.2                       |-27.2                      |-27.2                           |-27.2                                  |
|&nbsp;&nbsp; max         |35.6                             |35.6                        |35.6                            |35.6                            |35.6                        |35.6                       |35.6                            |35.6                                   |
|&nbsp;&nbsp; mean (sd)   |8.74 &plusmn; 11.57              |8.74 &plusmn; 11.57         |8.74 &plusmn; 11.57             |8.74 &plusmn; 11.57             |8.74 &plusmn; 11.57         |8.74 &plusmn; 11.57        |8.74 &plusmn; 11.57             |8.74 &plusmn; 11.57                    |
|**Visibility**           |&nbsp;&nbsp;                     |&nbsp;&nbsp;                |&nbsp;&nbsp;                    |&nbsp;&nbsp;                    |&nbsp;&nbsp;                |&nbsp;&nbsp;               |&nbsp;&nbsp;                    |&nbsp;&nbsp;                           |
|&nbsp;&nbsp; min         |0                                |0                           |0                               |0                               |0                           |0                          |0                               |0                                      |
|&nbsp;&nbsp; max         |32.2                             |32.2                        |32.2                            |32.2                            |32.2                        |32.2                       |32.2                            |32.2                                   |
|&nbsp;&nbsp; mean (sd)   |14.38 &plusmn; 6.92              |14.38 &plusmn; 6.92         |14.38 &plusmn; 6.92             |14.38 &plusmn; 6.92             |14.38 &plusmn; 6.92         |14.38 &plusmn; 6.92        |14.38 &plusmn; 6.92             |14.38 &plusmn; 6.92                    |

---

---

|                         |Month: 1 (N = 5,952)  |Month: 2 (N = 5,376)  |Month: 3 (N = 5,952) |Month: 4 (N = 5,752) |Month: 5 (N = 5,952) |Month: 6 (N = 5,760) |Month: 7 (N = 5,952) |Month: 8 (N = 5,952) |Month: 9 (N = 5,760) |Month: 10 (N = 5,952) |Month: 11 (N = 5,760) |Month: 12 (N = 5,952) |
|:------------------------|:---------------------|:---------------------|:--------------------|:--------------------|:--------------------|:--------------------|:--------------------|:--------------------|:--------------------|:---------------------|:---------------------|:---------------------|
|**Electricity per SQFT** |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;          |
|&nbsp;&nbsp; min         |0.0003643580          |0.0002633870          |0.0002036279         |0.0001484373         |0.0001484373         |0.0001484373         |0.0001484373         |0.0001484373         |0.0001484373         |0.0003140090          |0.0002775098          |0.0004192674          |
|&nbsp;&nbsp; max         |0.01141661            |0.01136653            |0.01142784           |0.01240610           |0.01278610           |0.01562244           |0.01552343           |0.01542802           |0.01322155           |0.01154326            |0.01139283            |0.01136574            |
|&nbsp;&nbsp; mean (sd)   |0.00 &plusmn; 0.00    |0.00 &plusmn; 0.00    |0.00 &plusmn; 0.00   |0.00 &plusmn; 0.00   |0.00 &plusmn; 0.00   |0.00 &plusmn; 0.00   |0.00 &plusmn; 0.00   |0.00 &plusmn; 0.00   |0.00 &plusmn; 0.00   |0.00 &plusmn; 0.00    |0.00 &plusmn; 0.00    |0.00 &plusmn; 0.00    |
|**Solar Elevation**      |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;          |
|&nbsp;&nbsp; min         |-69.94282             |-64.48136             |-54.64840            |-42.40576            |-31.79671            |-24.92542            |-28.98990            |-38.52555            |-49.70109            |-61.09720             |-68.22575             |-70.14049             |
|&nbsp;&nbsp; max         |29.81899              |39.21030              |51.55384             |61.80404             |68.70540             |70.27031             |69.96813             |64.84336             |54.89274             |43.33530              |32.35638              |25.02829              |
|&nbsp;&nbsp; mean (sd)   |-16.67 &plusmn; 32.00 |-10.39 &plusmn; 32.32 |-1.17 &plusmn; 32.51 |8.28 &plusmn; 32.38  |15.38 &plusmn; 32.09 |18.56 &plusmn; 31.85 |16.92 &plusmn; 31.95 |10.83 &plusmn; 32.25 |2.04 &plusmn; 32.42  |-7.39 &plusmn; 32.36  |-15.02 &plusmn; 32.07 |-18.49 &plusmn; 31.84 |
|**Cloud Cover Fraction** |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;          |
|&nbsp;&nbsp; min         |0                     |0                     |0                    |0                    |0                    |0                    |0                    |0                    |0                    |0                     |0                     |0                     |
|&nbsp;&nbsp; max         |1                     |1                     |1                    |1                    |1                    |1                    |1                    |1                    |1                    |1                     |1                     |1                     |
|&nbsp;&nbsp; mean (sd)   |0.76 &plusmn; 0.37    |0.74 &plusmn; 0.39    |0.59 &plusmn; 0.45   |0.63 &plusmn; 0.43   |0.55 &plusmn; 0.41   |0.55 &plusmn; 0.39   |0.55 &plusmn; 0.37   |0.63 &plusmn; 0.37   |0.52 &plusmn; 0.39   |0.61 &plusmn; 0.43    |0.72 &plusmn; 0.39    |0.85 &plusmn; 0.27    |
|**Dew Point**            |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;          |
|&nbsp;&nbsp; min         |-25.6                 |-31.7                 |-14.4                |-11.7                |-3.3                 |-4.4                 |8.9                  |5.6                  |1.7                  |-7.2                  |-8.9                  |-18.2                 |
|&nbsp;&nbsp; max         |9.4                   |8.3                   |12.8                 |17.8                 |21.7                 |23.3                 |24.4                 |23.9                 |19.4                 |14.4                  |14.4                  |5.6                   |
|&nbsp;&nbsp; mean (sd)   |-9.54 &plusmn; 8.00   |-8.96 &plusmn; 8.36   |-2.35 &plusmn; 5.24  |0.56 &plusmn; 6.86   |8.58 &plusmn; 5.15   |13.12 &plusmn; 6.08  |16.61 &plusmn; 3.61  |15.48 &plusmn; 4.19  |12.42 &plusmn; 4.02  |5.52 &plusmn; 3.96    |0.57 &plusmn; 5.19    |-5.66 &plusmn; 4.25   |
|**Humidity Fraction**    |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;          |
|&nbsp;&nbsp; min         |0.44                  |0.40                  |0.27                 |0.18                 |0.25                 |0.20                 |0.36                 |0.37                 |0.38                 |0.41                  |0.43                  |0.41                  |
|&nbsp;&nbsp; max         |1                     |1                     |1                    |1                    |1                    |1                    |1                    |1                    |1                    |1                     |1                     |1                     |
|&nbsp;&nbsp; mean (sd)   |0.76 &plusmn; 0.12    |0.81 &plusmn; 0.13    |0.76 &plusmn; 0.17   |0.59 &plusmn; 0.22   |0.66 &plusmn; 0.20   |0.69 &plusmn; 0.22   |0.74 &plusmn; 0.19   |0.75 &plusmn; 0.17   |0.79 &plusmn; 0.17   |0.82 &plusmn; 0.16    |0.83 &plusmn; 0.13    |0.81 &plusmn; 0.09    |
|**Precipitable Water**   |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;          |
|&nbsp;&nbsp; min         |3                     |3                     |5                    |5                    |9                    |15                   |21                   |15                   |12                   |7                     |6                     |4                     |
|&nbsp;&nbsp; max         |19                    |17                    |23                   |31                   |38                   |43                   |45                   |44                   |34                   |25                    |25                    |15                    |
|&nbsp;&nbsp; mean (sd)   |6.99 &plusmn; 3.32    |7.22 &plusmn; 3.09    |9.76 &plusmn; 3.13   |13.93 &plusmn; 5.39  |18.53 &plusmn; 5.81  |28.97 &plusmn; 7.68  |31.50 &plusmn; 5.91  |27.59 &plusmn; 6.68  |22.93 &plusmn; 5.33  |15.15 &plusmn; 3.49   |11.52 &plusmn; 3.91   |8.03 &plusmn; 1.83    |
|**Temperature**          |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;          |
|&nbsp;&nbsp; min         |-23.9                 |-27.2                 |-11.1                |-6.7                 |0.0                  |0.6                  |8.9                  |8.3                  |2.8                  |-5.0                  |-7.2                  |-15.6                 |
|&nbsp;&nbsp; max         |11.1                  |8.3                   |15.0                 |28.3                 |29.4                 |35.6                 |33.9                 |32.8                 |28.9                 |21.7                  |18.3                  |5.6                   |
|&nbsp;&nbsp; mean (sd)   |-5.74 &plusmn; 7.99   |-6.00 &plusmn; 7.51   |1.97 &plusmn; 5.08   |8.82 &plusmn; 7.02   |15.77 &plusmn; 6.15  |20.09 &plusmn; 6.68  |22.09 &plusmn; 5.34  |20.66 &plusmn; 5.21  |16.66 &plusmn; 5.06  |8.75 &plusmn; 4.67    |3.33 &plusmn; 5.13    |-2.51 &plusmn; 4.08   |
|**Visibility**           |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;         |&nbsp;&nbsp;          |&nbsp;&nbsp;          |&nbsp;&nbsp;          |
|&nbsp;&nbsp; min         |0.1                   |0.2                   |0.4                  |0.2                  |1.6                  |1.6                  |0.8                  |0.8                  |0.1                  |0.0                   |0.8                   |0.0                   |
|&nbsp;&nbsp; max         |24.1                  |24.1                  |32.2                 |32.0                 |32.2                 |24.0                 |24.0                 |32.2                 |32.2                 |32.2                  |32.2                  |32.2                  |
|&nbsp;&nbsp; mean (sd)   |12.13 &plusmn; 5.84   |11.12 &plusmn; 6.91   |15.71 &plusmn; 7.57  |17.55 &plusmn; 5.73  |17.83 &plusmn; 6.95  |16.19 &plusmn; 5.74  |16.51 &plusmn; 6.52  |14.27 &plusmn; 6.50  |12.72 &plusmn; 6.93  |13.94 &plusmn; 6.76   |11.64 &plusmn; 5.65   |12.73 &plusmn; 7.15   |
