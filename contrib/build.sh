 #!/bin/bash
 docker build -f ../Dockerfile \
    -t neuroforgede/bookstack:latest \
    -t neuroforgede/bookstack:22.11.1 \
    ../

docker push neuroforgede/bookstack:latest
docker push neuroforgede/bookstack:22.11.1