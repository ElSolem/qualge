import os
import requests
import subprocess

# === Configuration ===
GITHUB_REPO_RAW = "https://raw.githubusercontent.com/yourusername/yourrepo/main/"
FILENAME = "sample.exe"
DEST_PATH = os.path.join(os.getcwd(), FILENAME)

# === Download Function ===
def download_file(url, dest):
    print(f"Downloading {url} -> {dest}")
    response = requests.get(url, stream=True)
    if response.status_code == 200:
        with open(dest, 'wb') as f:
            for chunk in response.iter_content(1024):
                f.write(chunk)
        print("Download complete.")
    else:
        raise Exception(f"Failed to download: {response.status_code}")

# === Execution Function (Optional, Dangerous) ===
def execute_binary(path):
    print(f"Executing binary: {path}")
    subprocess.run([path], shell=True)

# === Main Execution ===
if __name__ == "__main__":
    full_url = GITHUB_REPO_RAW + FILENAME
    try:
        download_file(full_url, DEST_PATH)

        # WARNING: Executing a suspicious file. Sandbox only.
        # Uncomment the line below at your own risk.
        # execute_binary(DEST_PATH)

    except Exception as e:
        print(f"Error: {e}")