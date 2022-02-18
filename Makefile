BINARY = hostname
IMAGE_REGISTRY = harbor.beautytiger.home
IMAGE_REPO = myapplication/accept-server
IMAGE_TAG = latest

.PHONY: serve

serve:
	uvicorn main:app --reload
build:
	go build -o $(BINARY) main.go
image:
	docker build -t $(IMAGE_REGISTRY)/$(IMAGE_REPO):$(IMAGE_TAG) .
release: image
	docker push $(IMAGE_REGISTRY)/$(IMAGE_REPO):$(IMAGE_TAG)
