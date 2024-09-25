# 该镜像需要依赖的基础镜像
FROM openjdk:11
ENV name 'wvp-pro'
ENV active 'dev'
ADD ${name}*.jar /${name}.jar
ENV port 18080

EXPOSE 18080/tcp
EXPOSE 5060/tcp
EXPOSE 5060/udp

ENTRYPOINT ["java","-Dserver.port=${port}", "-jar","/${name}.jar", "--spring.profiles.active=${active}"]
# 指定维护者的名字
MAINTAINER yuhang