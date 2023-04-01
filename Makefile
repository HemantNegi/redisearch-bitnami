export VERSION := "2.6.8"

# build image for arm v7, arm v8 and amd64
build:
	@docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag hemantnegi/redisearch:${VERSION} --tag hemantnegi/redisearch:latest .


dockerhub:
	@docker build -t hemantnegi/redisearch:${VERSION} .
	@docker push hemantnegi/redisearch:${VERSION}

