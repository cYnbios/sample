$(aws ecr get-login --no-include-email --region us-west-2)
docker build -t webapp .
docker tag webapp:latest 417355929136.dkr.ecr.us-west-2.amazonaws.com/webapp:latest
docker push 417355929136.dkr.ecr.us-west-2.amazonaws.com/webapp:latest

# docker run -p 3000:3000 -d 417355929136.dkr.ecr.us-west-2.amazonaws.com/webapp