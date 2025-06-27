# typesense-on-render
Deploy [Typesense](https://typesense.org/) on [Render.com](https://render.com)

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

## Setup

### Environment variables on Render.com:


Key: HOST
Value: 0.0.0.0

Key: PORT
Value: 8108

Key: TYPESENSE_API_KEY
Value: <a randomly generated key>

Key: TYPESENSE_DATA_DIR
Value: /tmp/typesense-data

Key: TYPESENSE_ENABLE_CORS
Value: true

(note the current Dockerfile uses hardcoded, not env variables, but result should be the same

### more background

This forked from [https://github.com/hmbrg/typesense-on-render](https://github.com/hmbrg/typesense-on-render)

I had to tweak the setup, e.g. 

```
I am not sure exactly what of the below makes it work, but I can connect now. I did the following:

Included a Typesense api key in render.yaml, e.g.
...
  envVars:
  - key: TYPESENSE_API_KEY
    value: <a new api key string>
...
though once I got this working, I removed that key and it continued to work. Perhaps I did something wrong with the "generate: true" option this repo uses.

(I had set the environment variable in the Render Dashboard, but it did not seem to work until I added it explicitly to the YAML file)

included a start command that specifies a listen address and port, e.g. on the Render Settings part of the dashboard, I set Docker Command to
/opt/typesense-server --data-dir=/typesense-data --api-key=<my api key string> --listen-address=0.0.0.0 --listen-port=8108 --enable-cors
set Environment variables on the Render.com dashboard, e.g.
HOST => 0.0.0.0
PORT => 8108
TYPESENSE_API_KEY =>
TYPESENSE_DATA_DIR => /typesense-data (same as the yaml file)

Some of these seem redundant, but I thought I had tried the various subsets independently. 🤷
```

details: https://github.com/hmbrg/typesense-on-render/issues/1

## Environment Variables
- `TYPESENSE_API_KEY` -- A bootstrap admin API key that allows all operations. Be sure to create additional keys with specific ACLs using the [key management API](https://typesense.org/docs/0.21.0/api/api-keys.html). (Default = `{randomly_generated_key}`)
- `TYPESENSE_DATA_DIR` -- Path to the directory where data will be stored on disk. Probably don't need to change this, as it's also in the render.yaml (Default = `/typesense-data`)
- `TYPESENSE_ENABLE_CORS` -- Allow JavaScript client to access Typesense directly from the browser. (Default = `true`)

See full list of options you can configure [here](https://typesense.org/docs/0.21.0/guide/configure-typesense.html)
