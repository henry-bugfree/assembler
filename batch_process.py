import os

if __name__ == "__main__":
    for root, dirs, files in os.walk(r".\o_testcase"):
        for file in files:
            print(os.path.join(root,file))
