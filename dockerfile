# addition.py
# ==============================================
# import web

# urls = (
#     '/add/(.*?)/(.*?)', 'add'
# )
# app = web.application(urls, globals())
# class add:        
#     def GET(self, a, b):
#         return "{0} + {1} = {2}".format(a, b, (int(a) + int(b)))

# if __name__ == "__main__":
#     app.run()

# ===============================================

# Question - Create a web server that adds two numbers
# We need to do the following things:
# Create a Dockerfile to create a python webserver with the scipt - addition.py . Use a base image that has python in the correct version; python 2.7. Go to the official python repo on Docker Hub and choose a python image that comes from alpine linux, and has a python 2.7 version
# Install the python package called web.py using the python package installer: pip. See link for how to install the package. Find a way to do this in the dockerfile.
# Add addition.py to the container
# Use the dockerfile command ENTRYPOINT to tell docker to start the server using the python executable.
# Build and run the docker
# Now build the new docker images with a tag called add-server.
# After building the image, start a container running the add-server image. web.py will automatically listen on port 8080. So when we start the container we need to map this port to a port on the local machine to be able to access the endpoint.
# Now we should be able to access the following endpoint: http://localhost:8080/add/2/32 and see the calculation: 2 + 32 = 34.
# Finally push the docker image to the docker hub account.

FROM python:2.7-alpine

LABEL maintainer="arshad22shaik@gmail.com"

RUN pip install web.py 

WORKDIR /app

COPY . /app

EXPOSE 8080

ENTRYPOINT ["python", "addition.py"]