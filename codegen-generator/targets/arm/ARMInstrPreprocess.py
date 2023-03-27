import re
import json


if __name__ == "__main__":
    qwq = {}
    with open("asl/arch_decode_A64.asl", "r", encoding="UTF8") as f:
        lines = f.readlines()
    for line in lines:
        pair_pattern = re.compile(
            r'__encoding ([\w\.]*) // ([\w]*)').findall(line)
        if pair_pattern:
            qwq[pair_pattern[0][1]] = pair_pattern[0][0]
    with open("encodingmap.json", "w", encoding="UTF8") as f:
        json.dump(qwq, f)
