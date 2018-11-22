# drone-svn-client

Drone plugin to check out a working copy from an svn repository.

## Usage

### Docker

```shell
docker run --rm \
  -e URL=xxxxx \
  -e OUTPUT_PATH=xxxxx \
  -e USERNAME=xxxxx \
  -e PASSWORD=xxxxx \
  -e IGNORE_SERVER_CERT=false \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  liyibin/drone-svn-client
```

### Drone

```yaml
pipeline:
  clone:
    image: liyibin/drone-svn-client
    url: xxxxx
    output_path: xxxxx
    username: xxxxx
    password: xxxxx
    ignore_server_cert: false
```
