context:
	docker buildx create --platform linux/amd64,linux/386,linux/arm/v7,linux/arm64/v8 --use

build:
	docker buildx build --platform linux/amd64,linux/386,linux/arm/v7,linux/arm64/v8 -t docker-bug-value-too-long .