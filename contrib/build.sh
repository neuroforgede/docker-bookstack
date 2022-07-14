 #!/bin/bash
 docker build -f ../Dockerfile \
    -t neuroforgede/bookstack:latest \
    -t neuroforgede/bookstack:22.06.2 \
    ../

docker push neuroforgede/bookstack:latest
docker push neuroforgede/bookstack:22.06.2