# version 0.1
FROM ubuntu
MAINTAINER Nikhil Nanjappa "kainikhil@gmail.com"
RUN apt-get update && apt-get install -y make git ruby1.9.1-dev nodejs python
RUN gem install jekyll
EXPOSE 4000
WORKDIR /root/blog/
ENTRYPOINT ["jekyll"]
CMD ["serve","-H","0.0.0.0"]
