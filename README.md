# QuickFIX C++ for Mac (M1)

Docker-based build for QuickFIX C++ on Mac with M1 chip.

## Step-by-step

### 1. Build the image (builds QuickFIX inside the container)

```bash
docker build -t builder .
```

This builds the image and compiles QuickFIX inside it. The first run can take several minutes.

### 2. Copy QuickFIX from the container to this directory

```bash
./extract-build.sh
```

This copies the built `/quickfix` tree (source + binaries in `bin/`, `lib/`, `include/`) from the container into `./quickfix` in this repo.

To copy into a different directory:

```bash
./extract-build.sh ./my-quickfix
```

### 3. Remove `AllowedRemoteAddresses` from the executor config

Remove any `AllowedRemoteAddresses` lines from `quickfix/bin/cfg/executor.cfg` (and from any other config you use). They must not be present for the executor to run as intended.

### 4. Run the container with the copied QuickFIX mounted

```bash
./run.sh
```

This mounts your local `./quickfix` folder at `/quickfix` in the container and starts a shell. You run against the copied binaries and can edit files on the host.

Options:

```bash
./run.sh                    # mount ./quickfix, image builder
./run.sh ./my-quickfix      # mount ./my-quickfix as /quickfix
./run.sh ./quickfix quick-fix   # use image quick-fix instead of builder
```

---

**One-off shell (no mount):**  
`docker run --rm -it --entrypoint bash builder`
