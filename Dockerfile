#specify the base image needed for go application
FROM golang

#create directory to contain the go code in image
RUN mkdir /app 

#add all files in current folder (all source code) to app folder
ADD . /app

#make app folder as active folder on which all below commands will be executed
WORKDIR /app

#download all go dependencies
RUN go mod download

#build the code in current folder to create executable with name -> main
RUN go build -o main .

#execute the executable
CMD ["/app/main"]


