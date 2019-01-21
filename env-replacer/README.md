# drone-env-replacer

## Usage

### Docker

```shell
docker run --rm \
  -e SOURCE_ENV_FILE=.env.example \
  -e TARGET_ENV_FILE=.env \
  -e ENV_APP_NAME=Laravel_Production \
  -e ENV_APP_ENV=production \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  liyibin/drone-env-replacer
```

### Drone

```yaml
pipeline:
  - name: Replace env
    image: liyibin/drone-env-replacer
    settings:
      SOURCE_ENV_FILE: .env.example
      TARGET_ENV_FILE: .env
      ENV_APP_NAME: Laravel_Production
      ENV_APP_ENV: production
```
