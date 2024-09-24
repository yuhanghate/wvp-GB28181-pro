# 该镜像需要依赖的基础镜像
FROM openjdk:11
ENV name 'wvp-pro'
ENV active 'dev'
ADD ${name}*.jar /${name}.jar
ENV port 8080

EXPOSE 8080/tcp
EXPOSE 18080/tcp
EXPOSE 5060/tcp
EXPOSE 5060/udp
EXPOSE 6379/tcp
EXPOSE 18081/tcp
EXPOSE 80/tcp
EXPOSE 1935/tcp
EXPOSE 554/tcp
EXPOSE 554/udp
EXPOSE 30000-30500/tcp
EXPOSE 30000-30500/udp

ENTRYPOINT ["java","-Dserver.port=${port}", "-jar","/${name}.jar", "--spring.profiles.active=${active}"]
# 指定维护者的名字
MAINTAINER yuhang