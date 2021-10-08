aiohttp with charset-normalizer
-------------------------------

### Context

- `aiohttp.TCPConnector(limit=16)`
- alpine linux
- nginx 1.21
- python 3.9

Prepare the environment 

```
docker-compose build aiohttp-next server
docker-compose build --no-cache aiohttp-chardet

docker-compose up -d server
```

Collect results

```
docker-compose up aiohttp-chardet
docker-compose up aiohttp-next
```

Memory sampling (to be run in parallel of `aiohttp-*` services)

```
docker stats
```

### RAW performance

This come with no surprise as it was already proven previously.

- using charset-normalizer
  - 37.7s with 467 files --> 81ms 
- using chardet
  - 189.3s with 467 files --> 405ms

5 times faster while keeping 88% _(410 / 464 files)_ full backward compatible results.
- see https://github.com/Ousret/charset_normalizer/runs/3637139029 

### RAM footprint

Following issue https://github.com/aio-libs/aiohttp/issues/4112 it could be a good idea to showcase that aspect.
Using `docker stats` for the sampling.

Bellow, the peak usage for each flavor.

- using charset-normalizer
  - 38MiB
- using chardet
  - 67MiB

1.7 times less memory consumption. For a 5 times faster guess output (in avg).

### Other

Keep in mind that the actual delays may vary depending on your CPU capabilities. 
The factor between chardet/charset-normalizer flavors should remain intact.
