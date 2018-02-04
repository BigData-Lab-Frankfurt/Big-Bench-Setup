import csv
import argparse
import os

def parse_log(query, log_path, writer):
    print("\nParsing log for %s." % query)
    with open(log_path) as log:
        start_str = ""
        stop_str = ""
        for line in log:
            if "timestamp" in line:
                if "Start" in line:
                    start_str = line
                elif "Stop" in line:
                    stop_str = line
                else:
                    print("unrecognized timestamp:\n%s" % line)
    if not start_str or not stop_str:
        print("Timestamps not found for %s" % query)
        return
    print(start_str)
    print(stop_str)
    start_ts = (int)(start_str.split(" ")[-1])
    stop_ts = (int)(stop_str.split(" ")[-1])
    diff = stop_ts - start_ts
    print("time diff: %ds\n\n" % diff)
    writer.writerow([query, "%d" % diff])

def main():
    parser = argparse.ArgumentParser(description="BigBench logs parser.")
    parser.add_argument("logs_path", type=str)
    args = parser.parse_args()
    with open(os.path.join(args.logs_path, "BigBenchTimes.csv"), "w") as csvfile:
        writer = csv.writer(csvfile, delimiter=' ', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(["Query", "Time"])

        for filename in os.listdir(args.logs_path):
            if ".log" in filename:
                query = filename.split("_")[0]
                log_path = os.path.join(args.logs_path, filename)
                parse_log(query, log_path, writer)

if __name__ == "__main__":
    main()
