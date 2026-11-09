#!/usr/bin/env python3
"""Merge claude-base-settings.json into ~/.claude/settings.json."""
import json, os, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
SHARED = os.path.join(HERE, "claude-base-settings.json")
TARGET = os.path.expanduser(os.environ.get("CLAUDE_SETTINGS_FILE", "~/.claude/settings.json"))


def merge(local, shared):
    if isinstance(local, dict) and isinstance(shared, dict):
        out = dict(local)
        for k, v in shared.items():
            out[k] = merge(local[k], v) if k in local else v
        return out
    return shared


def main():
    try:
        with open(SHARED) as f:
            shared = json.load(f)
    except FileNotFoundError:
        return 0
    except ValueError as e:
        print(f"claude-settings-sync: invalid shared JSON: {e}", file=sys.stderr)
        return 1

    local = {}
    if os.path.exists(TARGET):
        try:
            with open(TARGET) as f:
                text = f.read()
            if text.strip():
                local = json.loads(text)
        except ValueError as e:
            print(f"claude-settings-sync: {TARGET} is not valid JSON, leaving it alone: {e}", file=sys.stderr)
            return 1
        if not isinstance(local, dict):
            print(f"claude-settings-sync: {TARGET} is not a JSON object, leaving it alone", file=sys.stderr)
            return 1

    merged = merge(local, shared)
    if merged == local and os.path.exists(TARGET):
        return 0

    os.makedirs(os.path.dirname(TARGET), exist_ok=True)
    if os.path.exists(TARGET):
        with open(TARGET + ".bak", "w") as f:
            f.write(text)
    real = os.path.realpath(TARGET)
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(real), prefix=".settings.", suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            json.dump(merged, f, indent=2)
            f.write("\n")
        if os.path.exists(real):
            os.chmod(tmp, os.stat(real).st_mode & 0o777)
        os.replace(tmp, real)
    except BaseException:
        os.unlink(tmp)
        raise
    return 0


if __name__ == "__main__":
    sys.exit(main())
