 #!/bin/bash
 docker build -f ../Dockerfile \
    -t neuroforgede/bookstack:latest \
    -t neuroforgede/bookstack:22.10.1 \
    ../

docker push neuroforgede/bookstack:latest
docker push neuroforgede/bookstack:22.10.1