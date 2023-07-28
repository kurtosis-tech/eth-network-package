import multiprocessing
import subprocess
import sys
import time

has_error = False

def run_command(command):
    print(f"executing {command}")
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    if process.returncode != 0:
        print(f"Error occurred while executing: {command}\n")
        print(f"Error output:\n{stderr.decode('utf-8')}\n")
        global has_error
        has_error = True

if __name__ == "__main__":
    print(f"starting at {time.localtime()}")
    commands = []
    num_keys_per_node = int(sys.argv[1])

    for index in range(0, int(sys.argv[2])):
        start_index = index * num_keys_per_node
        end_index = (index+1) * num_keys_per_node
        command = [
            "eth2-val-tools",
            "keystores",
            "--insecure",
            "--prysm-pass",
            f"{sys.argv[3]}",
            "--out-loc",
            f"/node-{index}-keystores",
            "--source-mnemonic",
            f"\"{sys.argv[4]}\"",
            "--source-min",
            f"{start_index}",
            "--source-max",
            f"{end_index}",
        ]

        commands.append(" ".join(command))

    max_concurrent_processes = 10

    with multiprocessing.Pool(processes=max_concurrent_processes) as pool:
        results = pool.map(run_command, commands)

    if has_error:
        raise Exception("One or more processes encountered an error.")

    print(f"ended at {time.localtime()}")
