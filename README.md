# Big-Bench-TPCx-BB
This repository just represents our Big-Bench setup.

## Installation

After cloning the repository execute the following steps

**Get submodules**

```
git submodule init
git submodule update
```

**Compile parse-big-bench**

```
cd parse-big-bench
mvn clean package
```

## Configuration

* Adjust Big-Bench settings
* Define queries and engines you want to execute in bin/global.sh

## Usage

Use scripts in bin directory to execute queries, generate your times csv (parse-big-bench) or to collect results from Big-Bench results tables.

* **global.sh** (settings) -- Settings are stored in the file global.sh, which is included at the beginning of all executable helper scripts. It is not executable itself, but contains shared functions and constants. For example, the name of the BigBench database can be set with the constants bigbench_db. The **$BIGBENCH_SETUP_ROOT** variable represents the path to the root of the local BigBench Setup repository. The idea behind this file is, that it is the only one which has to be adjusted by the user.

* **bigbench_generate-data.sh scale factor** (generate and load data) -- The helper script to generate and load data is just to simplify the respective command of BigBench. The official BigBench command involves using the command to run BigBench completely and to skip each phase except generate and load data by passing respective skip parameters. The generate and load data helper script reduces the number of parameters to a single one. Only the scale factor has to be passed as parameter.

* **bigbench_run-queries.sh** (run queries) -- BigBench itself does only offer the option to run a single query or all queries. Furthermore, in each run all queries have to be executed with the same engine. The queries and the engines with which they should be executed are defined by setting the constants queries and engines respectively in the settings file mentioned above. The result is the execution of each set query with every set engine.

* **bigbench_generate-times-csv.sh** (generate times CSV file) -- The helper script to generate times-CSV file utilizes the parse-big-bench functionality. Taking into account all query runs for which a log file is stored in the BigBench log directory, a times-CSV file BigBenchTimes.csv is generated and saved to the log directory and a quick check for any potential errors is performed.

* **bigbench_collect-table-metadata.sh source** (collect table metadata) -- The collect table metadata helper script collects the number of rows and one sample row for the tables existing in the BigBench database. This information is written to a CSV file **bigbench-results_%Y-%m-%d_%H-%M-%S.csv** in the BigBench log directory and allows the validation of correct results more easily. When calling the collect table metadata helper script, it can be specified if this information should be collected for the data model or the query results. This specication is made by passing or not passing the parameter source. If the source parameter is passed to the helper script, the information will be collected for the database tables of the data model. If the source parameter is not passed to the helper script, the information will be collected for the database tables of the query results.

* **bigbench_clean-up.sh** (clean up) -- The helper script for clean up is designed to extend the respective command of BigBench. It removes the result tables of all BigBench queries in the database. Additionally, all files in the BigBench log directory are deleted so everything is in order for executing another benchmarking run


## Validation reference

This section should serve as reference for validating source tables and query results. Row counts of the various tables can be found for the scale factors 100, 300, 600 and 1000.

**Source tables**

| Table Name             | Row Count SF 100 | Row Count SF 300 | Row Count SF 600 | Row Count SF 1000 | Sample Row                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|------------------------|------------------|------------------|------------------|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| customer               | 990000           | 1714731          | 2424996          | 3130656           | 0 AAAAAAAAAAAAAAAA 1824793 3203 25558 14690 14690 Ms. Marisa Harrington N 17 4 1988 UNITED ARAB EMIRATES PQByuX1WeD19 Marisa.Harrington@lawyer.com fcKlEcS7                                                                                                                                                                                                                                                                                                                                                               |
| customer_address       | 495000           | 857366           | 1212498          | 1565328           | 0 AAAAAAAAAAAAAAAA 561 Cedar 12th Road I3jhw5ICEB White City Montmorency County MI 64453 United States -5.0 condo                                                                                                                                                                                                                                                                                                                                                                                                         |
| customer_demographics  | 1920800          | 1920800          | 1920800          | 1920800           | 0 F U Primary 6000 Good 0 5 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| date_dim               | 109573           | 109573           | 109573           | 109573            | 0 AAAAAAAAAAAAAAAA 1900-01-01 0 0 0 1900 1 1 1 1 1900 0 0 Monday 1900Q1 Y N N 2448812 2458802 2472542 2420941 N N N N N                                                                                                                                                                                                                                                                                                                                                                                                   |
| household_demographics | 7200             | 7200             | 7200             | 7200              | 0 3 1001-5000 0 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| income_band            | 20               | 20               | 20               | 20                | 0 1 10000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| inventory              | 883693800        | 1852833814       | 2848155453       | 3824032470        | 38220 53687 15 65                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| item                   | 178200           | 308652           | 436499           | 563518            | "0 AAAAAAAAAAAAAAAA 2000-01-14 quickly even dinos beneath the frays must have to boost boldly careful bold escapades: stealthily even forges over the dependencies integrate always past the quiet sly decoys-- notornis solve fluffily; furious dinos doubt with the realms: always dogged dinos among the slow pains 28.68 69.06 3898712 50RQ6LQauF0XabhPLF4tsAFIvliiMoGQv 1 Fan Shop 9 Sports & Outdoors 995 0UMxurGVvkHOSQk5 small 77DdZq5tEbYRQBkvV1 dodger Oz Unknown 18 7l8m4P6R12CMVibnv4mUkg4ybmpv0RIMoMHKWhKU9" |
| item_marketprices      | 891000           | 1543257          | 2182495          | 2817590           | 0 60665 5VitFqR2CxJ 95.41 7604 92131                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| product_reviews        | 1034796          | 2007732          | 3143124          | 4450482           | 187125 2186-01-31 114344 5 93256 6994338712124158976 8520181449317677056 When tried these Jobst 15-20 mmHg pantyhose in my waist at the waist cincher is not for you. tried tucking the net piece part of the dryer covered with wrinkles                                                                                                                                                                                                                                                                                 |
| promotion              | 3707             | 4520             | 5033             | 5411              | 0 AAAAAAAAAAAAAAAA 61336 94523 104776 445.17 1 able Y N N N N N N N always bold warthogs despite the dugouts will play closely b Unknown N                                                                                                                                                                                                                                                                                                                                                                                |
| reason                 | 433              | 527              | 587              | 631               | 0 48h2I9vhvJ slyly thin dugouts on the ironically enticing real                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| ship_mode              | 20               | 20               | 20               | 20                | 0 FW7qE09M ZjZ84JKe 8CNtE5D IpPSqBCvGzN4m6G 75jAyujyTumy2CFBWAQD                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| store                  | 120              | 208              | 294              | 379               | "0 AAAAAAAAAAAAAAAA 2000-08-08 71238 able 217 8891512 8AM-12AM Joshua Watson 6 Unknown realms sublate quickly outside the epitaphs; evenly silent patterns boost! thin patterns within the daring thin sheaves nod daringly instead of the fluffy final soma Randy King 1 Unknown 1 Unknown 916 1st Boulevard WD Post Oak Hoke County NC 47562 United States -5.0 0.11"                                                                                                                                                   |
| store_returns          | 6108428          | 19740384         | 40807766         | 69407907          | 66190 80578 57566 962182 611011 2556 419286 83 152 3518518 19 700.34 42.02 742.36 79.14 103.0 413.2 267.04 20.1 187.04                                                                                                                                                                                                                                                                                                                                                                                                    |
| store_sales            | 107843438        | 348352146        | 720479689        | 1224712024        | 37337 84551 145227 190483 240122 2393 453476 7 2772 3562467 14 60.5 100.43 73.31 379.68 1026.34 847.0 1406.02 37.97 266.85 759.49 797.46 -87.51                                                                                                                                                                                                                                                                                                                                                                           |
| time_dim               | 86400            | 86400            | 86400            | 86400             | 0 AAAAAAAAAAAAAAAA 0 0 0 0 AM third night                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| warehouse              | 19               | 23               | 25               | 26                | 0 AAAAAAAAAAAAAAAA thin theodolites poach stealth 467315 738 Main Smith Cir. X3 Bethel Caldwell County KY 52585 United States -6.0                                                                                                                                                                                                                                                                                                                                                                                        |
| web_clickstreams       | 1092877307       | 3530048749       | 7300782597       | 12409888280       | 37340 3106 NULL 168922 133 NULL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| web_page               | 741              | 904              | 1007             | 1082              | 0 AAAAAAAAAAAAAAAA 2000-07-31 103908 107243 0 579660 http://www.A7Svq4s2L2eLJfz44PDVxeF0BuRRFhsKwBEnKjyzlcM3VebenChLAi7DYwXi7v6Kkca3dBvMV5Y.com feedback 2339 11 4 1                                                                                                                                                                                                                                                                                                                                                      |
| web_returns            | 6115748          | 19737891         | 40824500         | 69406183          | 55179 42872 35361 571349 1096022 2609 225532 571349 1096022 2609 225532 478 161 1779133 13 1826.37 127.85 1954.22 97.94 286.05 1205.4 546.45 74.52 541.75                                                                                                                                                                                                                                                                                                                                                                 |
| web_sales              | 107854751        | 348360527        | 720453868        | 1224631543        | 37791 77933 37869 25520 860026 1810864 3208 260615 860026 1810864 3208 260615 235 5 12 10 2130 7174583 16 11.34 33.23 21.93 180.8 350.88 181.44 531.68 4.95 185.97 132.92 164.91 169.86 297.83 302.78 -16.53                                                                                                                                                                                                                                                                                                              |
| web_site               | 30               | 30               | 30               | 30                | 0 AAAAAAAAAAAAAAAA 1999-08-16 site_0 12694 77464 Unknown Robert Stewart 1 even ruthless multipliers should have to maintain sometimes even ruthless bold notornis doubt: closely quiet hockey players behind the fluffily daring decoys try to maintain never along the thinly ironic t James Feliciano 3 bar 625 1st Lane EF85 Bolton Elbert County GA 68675 United States -5.0 0.04                                                                                                                                     |


**Query results**

| Query # | Row Count SF 100     | Row Count SF 300 | Row Count SF 600 | Row Count SF 1000 | Sample Row                                                                                                                                                                                                                            |
|---------|----------------------|------------------|------------------|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Q1      | 0                    | 0                | 0                | 0                 |                                                                                                                                                                                                                                       |
| Q2      | 1288                 | 1837             | 1812             | 1669              | 1415 41 1                                                                                                                                                                                                                             |
| Q3      | 131                  | 426              | 887              | 1415              | 20 5809 1                                                                                                                                                                                                                             |
| Q4      | 73926146             | 233959972        | 468803001        | 795252823         | 0_1199 1                                                                                                                                                                                                                              |
| Q5      | _logRegResult.txt_                                                          |||| AUC = 0.50 confusion: [[0.0, 0.0], [1.0, 3129856.0]] entropy: [[-0.7, -0.7], [-0.7, -0.7]]                                                                                                                                            |
| Q6      | 100                  | 100              | 100              | 100               | AAAAAAAAAAAAAAAA Marisa Harrington N UNITED ARAB EMIRATES PQByuX1WeD19 0.7015194245020148 0.6517334472176035                                                                                                                          |
| Q7      | 52                   | 52               | 52               | 52                | WY 63269                                                                                                                                                                                                                              |
| Q8      | 1                    | 1                | 1                | 1                 | 5.1591069883547675E11 5.382825071218451E10                                                                                                                                                                                            |
| Q9      | 1                    | 1                | 1                | 1                 | 10914483                                                                                                                                                                                                                              |
| Q10     | 2879890              | 5582973          | 8743044          | 12396422          | 479336 If this is some kind of works and she's really pretty but just couldn't get that excited about something dont make it reggae lyrics). POS kind                                                                                 |
| Q11     | 1                    | 1                | 1                | 1                 | 0,000677608                                                                                                                                                                                                                           |
| Q12     | 1697681              | 10196175         | 30744360         | 68614374          | 37134 37142 9 2950380                                                                                                                                                                                                                 |
| Q13     | 100                  | 100              | 100              | 100               | AAAAAAAAAAAAAAAA Marisa Harrington 0.4387617877663627 0.8869539352739836                                                                                                                                                              |
| Q14     | 1                    | 1                | 1                | 1                 | 0,998896356                                                                                                                                                                                                                           |
| Q15     | 7                    | 4                | 6                | 3                 | 1 -3.60713321147841 216619.96230580617                                                                                                                                                                                                |
| Q16     | 1431932              | 3697528          | 6404121          | 9137536           | AK AAAAAAAAAAAAAAMD -171.92000000000002 0.0                                                                                                                                                                                           |
| Q17     | 1                    | 1                | 1                | 1                 | 2.446298259939976E9 4.1096035613800263E9 59.526380669148935                                                                                                                                                                           |
| Q18     | 1501027              | 2805571          | 4361606          | 9280457           | ese 2044-02-07 We never really get to know what is not? NEG never                                                                                                                                                                     |
| Q19     | 15                   | 2                | 91               | 270               | 551717 Hooked myPlayStation 80GBup to mySamsung LN40A650 40-Inch 1080p 120Hz LCD HDTV with RED Touch of Colorand the screen flickered really bad while playingCall of Duty: World at War. NEG bad                                     |
| Q20     | _cluster.txt_                                                               |||| VL-1426457{n=599019 c=[1946576.977, 12.584, 5.737, 3.194, 6.563] r=[591462.113, 3.598, 2.609, 1.739, 2.011]}                                                                                                                          |
| Q21     | 0                    | 0                | 0                | 1                 | "AAAAAAAAAAABDCIK slow quick frays should promise enticingly through the quick asymptotes; furious theodolites beside the asymptotes kindle slowly foxes: furious somas through the slyly idle dolphin AAAAAAAAAAAAAADU eing 27 4 82" |
| Q22     | 11342                | 23149            | 0                | 47058             | careful wa AAAAAAAAAAAAAKLL 2545 2276                                                                                                                                                                                                 |
| Q23_1   | 9205                 | 19417            | 29613            | 39727             | 0 356 1 444.4 1.0716206156635266 0 356 2 354.5 1.2073749163813288                                                                                                                                                                     |
| Q23_2   | 492                  | 1080             | 1589             | 2129              | 0 483 2 262.0 1.694455894415943 0 483 3 390.25 1.0126729703080375                                                                                                                                                                     |
| Q24     | 9                    | 10               | 8                | 8                 | 7 NULL                                                                                                                                                                                                                                |
| Q25     | _cluster.txt_                                                               |||| VL-1906612{n=405237 c=[2804277.105, 1.000, 77.611, 1126397.997] r=[0:248120.802, 2:7.701, 3:126175.278]}                                                                                                                              |
| Q26     | _cluster.txt_                                                               |||| VL-2422906{n=684261 c=[0:1004083.596, 1:27.456, 2:22.124, 3:18.270, 9:32.999, 10:18.810] r=[0:271823.023, 1:6.530, 2:5.646, 3:5.027, 9:7.426, 10:5.127]}                                                                              |
| Q27     | 1                    | 0                | 3                | 0                 | 2412458 10653 American On an exploratory trip in "savage" lands                                                                                                                                                                       |
| Q28     | _classifierResult.txt_                                                      |||| Correctly Classified Instances          :    1060570       59.5777%                                                                                                                                                                   |
| Q29     | 72                   | 72               | 72               | 72                | 7 6 Toys & Games Tools & Home Improvement 4664408                                                                                                                                                                                     |
| Q30     | 72                   | 72               | 72               | 72                | 7 6 Toys & Games Tools & Home Improvement 42658456                                                                                                                                                                                    |

_* Q5, Q20, Q25, Q26, Q28: Query result is not a table but a file._

_* * Q10, Q18, Q19, Q27: Query result is not predictable and depends on each individual data generation because of text processing._

Push test from Matteo.
