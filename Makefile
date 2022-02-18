BINARY = hostname
IMAGE_REGISTRY = harbor.beautytiger.home
IMAGE_REPO = myapplication/accept-server
IMAGE_TAG = latest

.PHONY: serve

serve:
	uvicorn main:app --reload
build:
	docker build -t accept-server:build -f build.Dockerfile . && docker run --rm --user root -v /tmp/accept_server/:/tmp accept-server:build cp /app/dist/accept-server /tmp && cp /tmp/accept_server/accept-server .
image:
	docker build -t $(IMAGE_REGISTRY)/$(IMAGE_REPO):$(IMAGE_TAG) .
release: image
	docker push $(IMAGE_REGISTRY)/$(IMAGE_REPO):$(IMAGE_TAG)
