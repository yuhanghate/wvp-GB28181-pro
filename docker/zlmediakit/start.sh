#此镜像为github action 持续集成自动编译推送，跟代码(master分支)保持最新状态
docker run -d \
--restart always \
--name zlmediakit \
-p 1935:1935 \
-p 8080:80 \
-p 8443:443 \
-p 8554:554 \
-p 20000:10000 \
-p 20000:10000/udp \
-p 18000:8000/udp \
-p 19000:9000/udp \
-p 30000-30500:30000-30500/tcp \
-p 30000-30500:30000-30500/udp \
zlmediakit/zlmediakit:master