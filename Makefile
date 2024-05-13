IMAGE := example-flask
TAG := latest
VERSION := $(file < VERSION)

all: build

build:
	docker build -t $(IMAGE):$(TAG) --build-arg="VERSION=$(VERSION)" .

run: build
	docker run -ti --rm -p 5000:5000 --name $(IMAGE) $(IMAGE):$(TAG)
