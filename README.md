# apt-mirror

Docker image to clone given repositories.

The image can either run apt-mirror immediatly and stopping after one run or as a daily cron-alike job.

## Configuration

### Volumes

* `/mirror.list` - The configuration of apt-mirror. By default fetches
  * Ubuntu `artful`: main restricted universe multiverse main/debian-installer
  * Debian `stretch`: main contrib non-free main/debian-installer
* `/var/spool/apt-mirror` - The persistent storage. The 3 subdirectories will be created if they do not yet exist:
  * `mirror`
  * `skel`
  * `var`

### Environment variable

* `RUNAT` - Run `apt-mirror` daily at the given time. Format: `HH:mm`
  * If not set, `apt-mirror` will run immediatly and the docker container will stop after the run.

## Examples

### Run Once

`docker run --rm -v /path/to/local/mirror.list:/mirror.list -v /path/to/local/apt-mirror-storage:/var/spool/apt-mirror  5nafu:apt-mirror`

### Run daily at 3am
`docker run --rm -v /path/to/local/mirror.list:/mirror.list -v /path/to/local/apt-mirror-storage:/var/spool/apt-mirror -e RUNAT="3:00" 5nafu:apt-mirror`
