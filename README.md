# rpi-hugo

Docker image that runs the [Hugo](https://gohugo.io/) server in ARM environments, such as a Raspberry Pi. 

## Running a container
Running a container is super easy. In your Dockerfile for your website, simply set this image as the base:

```Dockerfile
FROM seanstaley/rpi-hugo
```

Next, `ADD` the directory of your Hugo site to a folder within the image. You could also volume mount the image.

```Dockerfile
ADD sample_site/ /site
```

Finally, set the `ENTRYPOINT` to run the server and bind to `0.0.0.0`. Otherwise, you will not be able to load the pages from within the Docker network or by exposing the `1313` port outside the container.

```Dockerfile
ENTRYPOINT hugo server --bind "0.0.0.0"
```

## Find an issue?
Report it using the `Issues` tab above.
