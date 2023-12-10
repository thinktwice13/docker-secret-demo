run:
	DOCKER_BUILDKIT=1 COMPOSE_DOCKER_CLI_BUILD=1 docker build --build-arg INSECURE_PASS=superInsecurePass123  -t dockersecretdemo --secret id=password,src=./password --progress=plain .
	docker history dockersecretdemo > dockersecretdemo.history