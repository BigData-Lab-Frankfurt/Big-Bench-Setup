# Big-Bench-Setup
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